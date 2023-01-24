extends AnimatedSprite

export var index: int
export var sound: AudioStream

signal activated


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = sound


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	activate()
		

func activate():
	if (self.frame != 1):
		self.frame = 1
		$AudioStreamPlayer2D.play()
		emit_signal("activated", self.index)
		


func deactivate():
	self.frame = 0
