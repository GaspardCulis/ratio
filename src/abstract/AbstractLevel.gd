class_name Level
extends TileMap

export(NodePath) var WorldSpawn
export(String) var otherDim: String

const PlayerScene = preload("res://scenes/Player/Player.tscn")
onready var WorldSpawnNode = get_node(WorldSpawn)


var player_instance: KinematicBody2D
func _ready():
	player_instance = PlayerScene.instance()
	self.add_child(player_instance)
	if Global.has_saved:
		Global.load_saved_player_state(player_instance)
	else:
		player_instance.global_position = WorldSpawnNode.global_position
	
func _input(event):
	if Input.is_action_just_pressed("switch_dim"):
		if (otherDim):
			Global.save_player_state(player_instance)
			get_tree().change_scene(otherDim)
		
