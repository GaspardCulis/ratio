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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menus/StartMenu.tscn")
