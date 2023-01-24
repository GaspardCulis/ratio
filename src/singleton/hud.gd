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
	if(get_node("/root/Global").isOnMusic) :
		$MusicLayer.visible = true
	else:
		$MusicLayer.visible = false
	
	$VBoxContainer2/HBoxContainer/Dimension.text = str(get_node("/root/Global").currentDimension)

func show_or_increment_counter():
	if (!$"OverlayFragments/HBoxContainer/Fragments-count".visible) :
		$"OverlayFragments/HBoxContainer/Fragments-count".visible = true
	else :
		$"OverlayFragments/HBoxContainer/Fragments-count".frame = $"OverlayFragments/HBoxContainer/Fragments-count".frame + 1

func close_counter_overlay():
	$"OverlayFragments/HBoxContainer/Fragments-count".visible = false

func show_and_animate_watch():
	$"OverlayFragments/HBoxContainer2/Animation_Watch".visible = true
	$"OverlayFragments/HBoxContainer2/Animation_Watch".play()

func set_music_tile_pressed(index: int):
	$MusicLayer/HBoxContainer.get_child(5 - index).frame = 1
	
func reset_music_tiles_pressed():
	for i in $MusicLayer/HBoxContainer.get_children() :
		i.frame = 0

func _input(ev):
	if (!get_node("/root/Global").onTitle):
		if ev is InputEventKey and ev.scancode == KEY_ESCAPE:
			$CanvasLayer/VBoxContainer/Continue.grab_focus()
			$CanvasLayer.visible = true
			get_tree().paused = true

func open_code_overlay() :
	$OverlayCode.visible = true
	
func close_code_overlay() :
	$OverlayCode.visible = false

func _on_Continue_pressed():
	$VBoxContainer2/HBoxContainer.visible = true
	$CanvasLayer.visible = false
	get_tree().paused = false


func _on_Exit_pressed():
	get_tree().quit()


func _on_Animation_Watch_animation_finished():
	$"OverlayFragments/HBoxContainer2/Animation_Watch".frame = 12
	$"OverlayFragments/HBoxContainer2/Animation_Watch".stop()
	$AnimationPlayer.play("watch")
