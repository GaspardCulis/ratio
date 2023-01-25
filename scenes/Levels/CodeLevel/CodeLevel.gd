extends "res://src/abstract/AbstractLevel.gd"

export var portePath: NodePath
onready var porte = get_node(portePath)

func _ready():
	$Present/Door.connect("openOverlay", self, "open_overlay")
	$Present/Door.connect("closeOverlay", self, "close_overlay")
	
	
func open_overlay():
	Hud.open_code_overlay()
	
func close_overlay():
	Hud.close_code_overlay()
	
func validate():
	yield(get_tree().create_timer(2), "timeout")
	porte.frame = 1
