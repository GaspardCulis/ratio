extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	SpeedrunMonitor.stop()
	Music.stop()
	Music.play_music(Music.CREDITS)
	Hud.update()
	get_node("VBoxContainer/VBoxContainer3/Button").grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menus/StartMenu.tscn")


func _on_Button_focus_entered():
	get_node("VBoxContainer/VBoxContainer3/Button").grab_focus()
