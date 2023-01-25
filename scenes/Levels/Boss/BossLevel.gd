extends "res://src/abstract/AbstractLevel.gd"

onready var porte := $Door

func _ready():
	#yield(get_tree().create_timer(10),"timeout")
	$HoundBoss.connect("boss_dead", self, "_on_TileMap_boss_dead")
	pass

func _on_TileMap_boss_dead():
	porte.set_opened(true)
