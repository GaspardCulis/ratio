extends TileMap




# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("byebyelagadji")
	yield(get_tree().create_timer(1.5), "timeout")
	yield(display_text("Bonne soiree au travail frero."), "completed")
	yield($AnimationPlayer, "animation_finished")
	$Label.text = ""
	$AnimationPlayer.play("jemedeplace")
	$AnimationPlayer.playback_speed = 1
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.play("dialogue")
	yield($AnimationPlayer, "animation_finished")
	yield(display_text("Que faites vous la professeur Blanchon ?\nJe vois que l'experience de mutation a marche ! Vous avez une sale tete... Vous m'entendez ?"), "completed")
	$nani.play()
	$Label.text = ""
	$AnimationPlayer.play("nani")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("exit")
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
