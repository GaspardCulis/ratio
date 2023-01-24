extends Node

var has_saved := false
var player_pos_save := Vector2.ZERO
var onTitle = true
var showFPS = false
var currentDimension = "Present"

var player_velocity_save := Vector2.ZERO
var player_animation_state := ""
var player_animation_frame := 0
var player_flip := 1

#Music
var isOnMusic = false

func load_saved_player_state(player: KinematicBody2D):
	if has_saved:
		player.global_position = player_pos_save
		player.velocity = player_velocity_save
		player.AnimationSprite.animation = player_animation_state
		player.AnimationSprite.frame = player_animation_frame
		player.AnimationSprite.scale.x = player_flip
		player.get_camera().reset_smoothing()
		
func save_player_state(player: KinematicBody2D):
	player_pos_save = player.global_position
	player_velocity_save = player.velocity
	player_animation_state = player.AnimationSprite.animation
	player_animation_frame = player.AnimationSprite.frame
	player_flip = player.AnimationSprite.scale.x
	has_saved = true
	
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
	
	
	
	
