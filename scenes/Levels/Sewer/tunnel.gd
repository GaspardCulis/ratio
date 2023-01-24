extends Area2D

signal openOverlay

export(Resource) var nextLevel:Resource

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
	if penetration and Input.is_action_just_pressed("action"):
		get_node("/root/Global").isOnMusic = false
		get_tree().change_scene(nextLevel.resource_path)
	else :
		emit_signal("openOverlay")
