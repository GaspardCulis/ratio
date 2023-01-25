extends Sprite


const PlayerType = preload("res://scenes/Player/Player.gd")
func _on_Area2D_body_entered(body):
	if body is PlayerType:
		$Camera2D.current = true
		Global.get_player().bouger = false
		get_parent().get_node("CanvasModulate").visible = false
		$Label.rect_position.x = -51
		$Label.rect_position.y = -32
		yield($Label.display_text("Professor B. stop this experiment! It will go wrong!"), "completed")
		yield(get_tree().create_timer(2), "timeout")
		$Label.rect_position.x = -21
		$Label.rect_position.y = -46
		yield($Label.display_text("I have to do it, in the name of science, no matter what impact it has on my body."), "completed")
		yield(get_tree().create_timer(2), "timeout")
		$Label.rect_position.x = -51
		$Label.rect_position.y = -40
		yield($Label.display_text("It will not only affect you, an innocent person will also lose their li..."), "completed")
		$BlanchonHd/Camera2D.current = true
		$BlanchonHd/AnimatedSprite.position = Vector2(-1.2, 22.7)
		Music.stop()
		yield(get_tree().create_timer(2), "timeout")
		var tween = create_tween()
		tween.tween_property($BlanchonHd/AnimatedSprite,  "position:y", 20.342, 1.0)
		tween.play()
		yield(tween, "finished")
		tween.kill()
		for i in ["full", "semi", "almost", "empty"]:
			$BlanchonHd/AudioStreamPlayer2D.play()
			yield($BlanchonHd/AudioStreamPlayer2D, "finished")
			yield(get_tree().create_timer(randf()), "timeout")
			$BlanchonHd/AnimatedSprite.animation = i
			
		yield(get_tree().create_timer(2), "timeout")
		$Camera2D.current = true
		yield($Label.display_text("Oh no !"), "completed")
		
		var tweene = create_tween()
		tweene.tween_property(self, "offset:x", 100.0, 1.5)
		tweene.play()
		yield(tweene, "finished")
		
		get_parent().get_node("Door").set_opened(true)
		
		self.queue_free()
		Global.get_player().Cam.current = true
		Global.get_player().bouger = true
		
		
		
		
