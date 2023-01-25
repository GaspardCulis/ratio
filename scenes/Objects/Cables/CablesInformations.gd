tool
extends Area2D

const Player = preload("res://scenes/Player/Player.gd")

func _ready():
	$KeyHint.visible = false
	$Informations.visible = false

var penetration := false
func _on_Area2D_body_entered(body):
	if body is Player:
		penetration = true
		$KeyHint.visible = true


func _on_Door_body_exited(body):
	if body is Player:
		penetration = false
		$KeyHint.visible = false
		$Informations.visible = false

func _input(event):
	if penetration and Input.is_action_just_pressed("action"):
		$Informations.visible = true
		$KeyHint.visible = false
