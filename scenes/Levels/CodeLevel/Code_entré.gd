extends LineEdit

func _ready():
	$".".grab_focus()


func _on_verify_numbers():
	if text == "3890":
		print("OK")
		get_tree().get_nodes_in_group("door")[0].get_child(0).frame = 1
		self.modulate = Color(0, 0, 0, 0)
		Hud.close_code_overlay()
	else:
		self.modulate = Color(1, 0, 0, 1)
		self.grab_focus()


func _on_button_pressed():
	Hud.close_code_overlay()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineEdit_text_changed(new_text):
	if (new_text.length() == 4):
		get_parent().get_parent().get_node("Button").grab_focus()

func _on_LineEdit_visibility_changed():
	$".".grab_focus()
