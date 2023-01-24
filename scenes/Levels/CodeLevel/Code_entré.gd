extends LineEdit

func _ready():
	connect("verify_numbers", self, "_on_verify_numbers")


func _on_verify_numbers():
	if text == "1234":
		print("OK")
		#ouvrir porte
	else:
		self.modulate = Color(1, 0, 0, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
