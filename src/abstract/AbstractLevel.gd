extends TileMap

export(NodePath) var WorldSpawn

const PlayerScene = preload("res://scenes/Player/Player.tscn")
onready var WorldSpawnNode = get_node(WorldSpawn)


# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = PlayerScene.instance()
	self.add_child(instance)
	instance.global_position = WorldSpawnNode.global_position
