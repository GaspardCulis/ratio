extends Node2D

export var label:String


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = label


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
