class_name Level
extends TileMap

export(NodePath) var WorldSpawn
export(Resource) var otherDim: Resource

const PlayerScene = preload("res://scenes/Player/Player.tscn")
onready var WorldSpawnNode = get_node(WorldSpawn)


# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = PlayerScene.instance()
	self.add_child(instance)
	instance.global_position = WorldSpawnNode.global_position
	
func _input(event):
	if Input.is_action_just_pressed("switch_dim"):
		if (otherDim):
			get_tree().change_scene(otherDim.resource_path)
		
