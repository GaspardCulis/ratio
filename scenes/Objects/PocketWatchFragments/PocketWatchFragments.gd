extends Sprite

signal retrieved

func _on_Area2D_body_entered(body) :
	retrieve()
	
func retrieve():
	self.visible = false
	$Area2D.monitoring = false
	emit_signal("retrieved")
