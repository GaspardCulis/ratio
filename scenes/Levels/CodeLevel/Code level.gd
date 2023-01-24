extends "res://src/abstract/AbstractLevel.gd"

func _ready():
	$Door.connect("openOverlay", self, "open_overlay")
	
func open_overlay():
	$CanvasLayer.visible = true
