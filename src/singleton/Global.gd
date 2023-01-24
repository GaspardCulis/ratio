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
