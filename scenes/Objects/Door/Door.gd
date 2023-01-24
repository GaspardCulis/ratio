tool
extends Area2D

signal openOverlay

export(Resource) var nextLevel:Resource
export var opened := false setget set_opened, get_opened

const Player = preload("res://scenes/Player/Player.gd")

func _ready():
	$KeyHint.visible = false

var penetration := false
func _on_Area2D_body_entered(body):
	if body is Player:
		penetration = true
		$KeyHint.visible = true


func _on_Door_body_exited(body):
	if body is Player:
		penetration = false
		$KeyHint.visible = false

func _input(event):
	print(penetration, opened)
	if penetration and get_opened() and Input.is_action_just_pressed("action"):
		get_node("/root/Global").isOnMusic = false
		Global.change_scene(nextLevel.resource_path)
	elif penetration and Input.is_action_just_pressed("action") :
		emit_signal("openOverlay")

func set_opened(opened: bool):
	$Overlay.frame = int(opened)
	
func get_opened() -> bool:
	return $Overlay.frame > 0
