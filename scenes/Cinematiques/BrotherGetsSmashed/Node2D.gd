extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_IntroAlex_finished():
	yield(get_tree().create_timer(0.2), "timeout")
	$"Intro-Sara".play()


func _on_Insidecinematic1_finished():
	yield(get_tree().create_timer(1), "timeout")
	$"Inside-cinematic-2".play()
