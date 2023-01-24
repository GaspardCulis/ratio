extends Node

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if(get_node("/root/Global").onTitle):
		$VBoxContainer2/HBoxContainer.visible = false
	else:
		$VBoxContainer2/HBoxContainer.visible = true
	if (get_node("/root/Global").showFPS):
		$VBoxContainer/FPSContainer.visible = true
		$VBoxContainer/FPSContainer/FPS_Counter.text = str(Engine.get_frames_per_second())
	else:
		$VBoxContainer/FPSContainer.visible = false
	
	$VBoxContainer2/HBoxContainer/Dimension.text = str(get_node("/root/Global").currentDimension)

func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_ESCAPE:
		$CanvasLayer.visible = true
		get_tree().paused = true


func _on_Continue_pressed():
	$VBoxContainer2/HBoxContainer.visible = true
	$CanvasLayer.visible = false
	get_tree().paused = false


func _on_Exit_pressed():
	get_tree().quit()
