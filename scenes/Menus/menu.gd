extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()
	Music.play_music(Music.TITLE)

func _on_Start_pressed():
	get_node("/root/Global").onTitle = false
	if (get_node("/root/Global").currentDimension == "Present"):
		Global.change_scene("res://scenes/Cinematiques/BrotherGetsSmashed/BrotherGetsSmashed.tscn")
	else:
		get_tree().change_scene("res://scenes/Levels/MusicLevel/MusicScene_past.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://scenes/Menus/Options.tscn")

func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/Menus/Credits.tscn")

func _on_Exit_pressed():
	get_tree().quit()
