extends Node2D

var tilesArray = []

export var portePath: NodePath
onready var porte = get_node(portePath)

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in self.get_children() :
		i.connect("activated", self, "on_tile_activate")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_tile_activate(index: int) :
	tilesArray.append(index)
	var isAllActivated:bool = true
	for i in self.get_children() :
		isAllActivated = isAllActivated and (i.frame == 1)
	
	if (isAllActivated):
		if (tilesArray == [4, 1, 0, 2, 3]):
			print("Validated")
			porte.frame = 1
		else:
			tilesArray = []
			yield(get_tree().create_timer(0.5), "timeout")
			for i in self.get_children() :
				i.frame = 0
