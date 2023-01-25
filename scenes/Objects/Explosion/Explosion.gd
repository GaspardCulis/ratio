extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.play("default")
	$AudioStreamPlayer2D.play()
	yield($AudioStreamPlayer2D, "finished")
	self.queue_free()
