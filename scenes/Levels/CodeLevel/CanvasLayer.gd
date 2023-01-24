extends CanvasLayer

export var portePath: NodePath
onready var porte = get_node(portePath)

func _ready():
	pass

func validate():
	yield(get_tree().create_timer(2), "timeout")
	porte.frame = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
