extends "res://src/abstract/AbstractLevel.gd"

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$"AnimatedDoor".frame = 0
