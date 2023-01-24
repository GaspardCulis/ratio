extends Node2D

export var portePath: NodePath
onready var porte = get_node(portePath)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Global").isOnMusic = true
	for i in self.get_children() :
		i.connect("activated", self, "on_tile_activate")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_tile_activate(index: int) :
	MLG.tilesArray.append(index)
	MLG.boolTilesArray[index] = true
	MLG.tilesCounter = MLG.tilesCounter + 1
	print(MLG.tilesArray)
	print(MLG.tilesCounter)
	if (MLG.tilesCounter == 5):
		if (MLG.tilesArray == [4, 1, 0, 2, 3]):
			print("Validated")
			porte.frame = 1
		else:
			yield(get_tree().create_timer(0.5), "timeout")
			reset_tiles()
			
func reset_tiles() :
	Hud.reset_music_tiles_pressed()
	MLG.tilesArray = []
	MLG.tilesCounter = 0
	MLG.boolTilesArray = [false, false, false, false, false]
	for i in self.get_children() :
				i.frame = 0
