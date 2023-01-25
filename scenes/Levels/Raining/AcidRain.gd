tool
extends CPUParticles2D

export var width := 200 setget set_width, get_width
 
func set_width(new_width: int):
	self.emission_rect_extents.x = new_width
	$Area2D/CollisionShape2D.scale.x = new_width
	width = new_width
	
func get_width() -> int:
	return width

const PlayerType := preload("res://scenes/Player/Player.gd")
const BossType := preload("res://scenes/HoundBoss/HoundBoss.gd")
func _on_Area2D_body_entered(body):
	if body is PlayerType:
		body.kill()
	elif body is BossType:
		body.damage()
