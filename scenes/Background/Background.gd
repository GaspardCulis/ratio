tool
extends ParallaxBackground


export var autoscroll := false

func _ready():
	if not autoscroll:
		offset.y = -320
	else:
		offset.y = 0

func _process(delta):
	if autoscroll:
		scroll_offset.x -= delta * 40
