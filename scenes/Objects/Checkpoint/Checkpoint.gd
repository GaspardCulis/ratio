extends Area2D


var used := false

const PlayerType := preload("res://scenes/Player/Player.gd")
func _on_Checkpoint_body_entered(body: PlayerType):
	if body is PlayerType and not used:
		body.spawnpoint = self.global_position
		used = true
