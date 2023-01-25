extends "res://src/abstract/AbstractLevel.gd"

func _ready():
	yield(get_tree().create_timer(10),"timeout")
