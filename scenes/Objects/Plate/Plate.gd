extends AnimatedSprite


export var son: AudioStream


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = son


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if (body is KinematicBody2D):
		self.frame = 1
		$AudioStreamPlayer2D.play()
		



func _on_Area2D_body_exited(body):
	self.frame = 0
