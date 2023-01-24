extends Node2D

var isPlayerInside = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func _input(event):
	if (isPlayerInside):
		if (event is InputEventKey):
			if (event.pressed and event.scancode == KEY_E):
				self.frame = 1
				$AudioStreamPlayer2D.play()
				yield(get_tree().create_timer(2), "timeout")
				self.frame = 0
				


func _on_Area2D_body_entered(body):
	isPlayerInside = true
	$Sprite.visible = true


func _on_Area2D_body_exited(body):
	isPlayerInside = false
	$Sprite.visible = false
