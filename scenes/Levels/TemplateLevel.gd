extends TileMap


const PlayerScene = preload("res://scenes/Player/Player.tscn")
onready var WorldSpawn = $WorldSpawn


# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = PlayerScene.instance()
	self.add_child(instance)
	instance.global_position = WorldSpawn.global_position

