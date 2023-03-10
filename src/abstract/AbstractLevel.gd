tool
extends TileMap

enum D {
	PRESENT = 0,
	PAST = 1
}

export (String) var LevelName
export(NodePath) var WorldSpawn
export(NodePath) var PresentTilesPath
export(NodePath) var PastTilesPath
export(D) var currentDimension = D.PRESENT

const PlayerScene = preload("res://scenes/Player/Player.tscn")
onready var WorldSpawnNode = get_node(WorldSpawn)
onready var PresentTiles = get_node(PresentTilesPath)
onready var PastTiles = get_node(PastTilesPath)



var player_instance: KinematicBody2D
func _ready():
	Global.levelIdx += 1
	if get_tree().has_method("is_editor_hint"): return
	player_instance = PlayerScene.instance()
	self.add_child(player_instance)
	player_instance.global_position = WorldSpawnNode.global_position
	player_instance.spawnpoint = WorldSpawnNode.global_position
	
	if (PresentTiles and PastTiles): 
		set_dimension(currentDimension)
		
	Hud.update()
	
func _input(event):
	if Input.is_action_just_pressed("switch_dim"):
		if (PresentTiles and PastTiles):
			switch_dimension()
func switch_dimension():
	set_dimension(int(not bool(currentDimension)))

func set_dimension(dimension: int):
	currentDimension = dimension
	PresentTiles.visible = dimension == 0
	PresentTiles.scale.y = 1 - dimension
	PresentTiles.scale.x = 1 - dimension
	PastTiles.visible = dimension == 1
	PastTiles.scale.y = dimension
	PastTiles.scale.x = dimension
	self.modulate = [Color.white, Color.gray][currentDimension]
	Global.currentDimension = ["Present", "Past"][currentDimension]
	
func get_dimension() -> int:
	return currentDimension
	
func _notification(what: int) -> void:
	match what:
		NOTIFICATION_PREDELETE:
			on_predelete()

func on_predelete():
	SpeedrunMonitor.create_checkpoint(LevelName)
