extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()

func _on_Start_pressed():
	get_node("/root/Global").onTitle = false
	get_tree().change_scene("res://scenes/Levels/Music level/MusicScene.tscn")

func _on_Options_pressed():
	get_tree().change_scene("res://scenes/Menus/Options.tscn")

func _on_Credits_pressed():
	get_tree().change_scene("res://scenes/Menus/Credits.tscn")

func _on_Exit_pressed():
	get_tree().quit()
