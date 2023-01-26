extends Node

var onTitle = true
var showFPS = false
var currentDimension = "Present"
var speedrun := false

#Music
var isOnMusic = false
	
const transTexture = preload("res://assets/texture/blan.png")
func change_scene(path: String):
	var sprite = Sprite.new()
	sprite.texture = transTexture
	sprite.modulate = Color.black
	sprite.modulate.a = 0.0
	
	get_tree().get_root().add_child(sprite)
	
	sprite.global_position = Vector2.ZERO
	sprite.scale = Vector2.ONE * 200
	
	var tween = create_tween()
	tween.tween_property(sprite, "modulate:a", 1.0, 0.5)
	tween.play()
	yield(tween, "finished")
	tween.kill()
	sprite.queue_free()
	get_tree().change_scene(path)
	var sprite2 = Sprite.new()
	sprite2.texture = transTexture
	sprite2.modulate = Color.black
	sprite2.modulate.a = 1.0
	
	get_tree().get_root().add_child(sprite2)
	
	sprite2.z_index = 100
	sprite2.global_position = Vector2.ZERO
	sprite2.scale = Vector2.ONE * 200
	
	var tween2 = create_tween()
	tween2.tween_property(sprite2, "modulate:a", 0.0, 0.5)
	tween2.play()
	yield(tween2, "finished")
	tween2.kill()
	sprite2.queue_free()
	

const PlayerType = preload("res://scenes/Player/Player.gd")
func get_player() -> PlayerType:
	return get_tree().get_nodes_in_group("player")[0]
	
	
	
