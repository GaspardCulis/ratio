extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if Input.is_action_just_pressed("switch_dim"):
		if (Global.currentDimension == "Past") :
			self.play()
		else :
			self.play("", true)
