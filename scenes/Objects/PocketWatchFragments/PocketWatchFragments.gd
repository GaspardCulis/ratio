extends Sprite

export var index:int
signal retrieved

func _on_Area2D_body_entered(body) :
	retrieve()
	
func retrieve():
	emit_signal("retrieved", index)
	self.visible = false
