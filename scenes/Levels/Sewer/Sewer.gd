extends "res://src/abstract/AbstractLevel.gd"

func _ready():
	$CanvasModulate.visible = true
	$Player/Light.visible = true
	get_tree().get_nodes_in_group("player")[0].SPEED = 150
	player_instance.stepping_on_stone = true
	
	Music.play_music(Music.BOSS)
