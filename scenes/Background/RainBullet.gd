extends Area2D

var time = 0
var rng = RandomNumberGenerator.new()


func _ready():
	pass # Replace with function body.

func _process(delta):
	rng.randomize()
	if(time == 200):
		$".".position.y = -130
		yield(get_tree().create_timer(1.5), "timeout")
		$".".position.y += rng.randf_range (10,100)
		time = 0
	else:
		if($".".position.y >= 220):
			$".".position.y = -130
		else:
			$".".position.y += rng.randf_range (10,20)
	time += 1




func _on_Bullet_body_entered(body :Node):
	if(body.has_method("kill")):
		body.kill()
