extends "res://src/abstract/AbstractLevel.gd"

export var portePath: NodePath
onready var porte = get_node(portePath)

func _ready():
	#yield(get_tree().create_timer(10),"timeout")
	$HoundBoss.connect("boss_dead", self, "_on_TileMap_boss_dead")
	pass

func _on_TileMap_boss_dead():
	print("Test")
	porte.frame = 1
