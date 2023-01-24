extends TileMap


const PlayerScene = preload("res://scenes/Player/Player.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = PlayerScene.instance()
	self.add_child(instance)

