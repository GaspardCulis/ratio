extends "res://src/abstract/AbstractLevel.gd"

const chemins_autres_dims := [
	"res://scenes/Levels/Jump level/Jump_past.tscn",
	"res://scenes/Levels/Jump level/Jump_present.tscn"
]

enum dimensions {
	PAST = 0,
	PRESENT = 1
}

export(dimensions) var dimension: int

func _ready():
	if Global.player_pos_save != Vector2.ZERO:
		get_player().global_position = Global.player_pos_save

func _input(event):
	if (event is InputEventKey):
		if (event.pressed and event.scancode == KEY_E):
			Global.player_pos_save = get_player().global_position
			get_tree().change_scene(chemins_autres_dims[dimension])
			

func get_player() -> KinematicBody2D:
	return get_tree().get_nodes_in_group("player")[0]
