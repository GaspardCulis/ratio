extends "res://src/abstract/AbstractLevel.gd"

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$"Animation_Door".frame = 0
