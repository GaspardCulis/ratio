extends TileMap




# Called when the node enters the scene tree for the first time.
func _ready():
	Music.stop()
	$FondNoirVoixOff.visible = true
	$FondNoirVoixOff/Label.visible = true
	$Camera2D2.current = true
	$"Node2D/Intro-Alex".play()
	yield(get_tree().create_timer(13.5), "timeout")
	$Camera2D.current = true
	$FondNoirVoixOff/Label.visible = false
	$FondNoirVoixOff.visible = false
	$AnimationPlayer.play("byebyelagadji")
	yield(get_tree().create_timer(1.5), "timeout")
	$"Node2D/Inside-cinematic-1".play()
	yield(display_text("Have a nice day Alex !"), "completed")
	yield($AnimationPlayer, "animation_finished")
	$Label.text = ""
	$AnimationPlayer.play("jemedeplace")
	$AnimationPlayer.playback_speed = 1
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.play("dialogue")
	yield($AnimationPlayer, "animation_finished")
	yield(display_text("What are you up to Dr.B?\nI can see that the mutation experiment has worked ! You're looking sick... Can you hear me?"), "completed")
	$Label.text = ""
	$nani.play()
	$AnimationPlayer.play("nani")
	yield($AnimationPlayer, "animation_finished")
	$FondNoirVoixOff.visible = true
	$AnimationPlayer.play("final_dialog")
	yield($AnimationPlayer, "animation_finished")
	Global.change_scene("res://scenes/Levels/WatchFragments/WatchFragmentsScene.tscn")
	

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		Global.change_scene("res://scenes/Levels/WatchFragments/WatchFragmentsScene.tscn")

func display_text(text: String):
	for i in range(text.length()):
		$Label.text = text.substr(0, i+1)
		$Boup.pitch_scale = 1 + (randf() - 0.5)*0.2
		$Boup.play()
		if text[i] in ['!', '?', ';', ',', '.']:
			yield(get_tree().create_timer(0.5), "timeout")
		else:
			yield(get_tree().create_timer(0.1), "timeout")
