extends "res://src/abstract/AbstractLevel.gd"

func _ready():
	$Player/Light.visible = true
	get_tree().get_nodes_in_group("player")[0].SPEED = 150
	player_instance.stepping_on_stone = true
