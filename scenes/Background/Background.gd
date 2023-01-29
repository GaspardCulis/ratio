tool
extends ParallaxBackground

enum D {
	PRESENT = 0,
	PAST = 1
}
var test
var lastDimension
export var autoscroll := false

func _ready():
	if not autoscroll:
		offset.y = -320
	else:
		offset.y = 0
	
func _process(delta):
	if autoscroll:
		scroll_offset.x -= delta * 40
	if(get_parent().name != "Hud"):
		if (!test):
				if(get_parent().currentDimension != D.PAST):
					match get_parent().name:
						"Raining":
							$".".get_child(0).modulate = Color("9dec92")
							$".".get_child(1).modulate = Color("9dec92")
							$".".get_child(2).modulate = Color("9dec92")
							$".".get_child(3).modulate = Color("9dec92")
							$".".get_child(4).modulate = Color("9dec92")
							$".".get_child(5).modulate = Color("9dec92")
							$".".get_child(6).modulate = Color("9dec92")
							$".".get_child(7).modulate = Color("9dec92")
							$".".get_child(8).modulate = Color("9dec92")
							get_parent().self_modulate = Color("9dec92")
							get_parent().get_node("PastTiles").self_modulate = Color("9dec92")
						"Jump":
							$".".get_child(0).modulate = Color("92d1ec")
							$".".get_child(1).modulate = Color("92d1ec")
							$".".get_child(2).modulate = Color("92d1ec")
							$".".get_child(3).modulate = Color("92d1ec")
							$".".get_child(4).modulate = Color("92d1ec")
							$".".get_child(5).modulate = Color("92d1ec")
							$".".get_child(6).modulate = Color("92d1ec")
							$".".get_child(7).modulate = Color("92d1ec")
							$".".get_child(8).self_modulate = Color("92d1ec")
						"*":
							$".".get_child(0).modulate = Color("92d1ec")
							$".".get_child(1).modulate = Color("92d1ec")
							$".".get_child(2).modulate = Color("92d1ec")
							$".".get_child(3).modulate = Color("92d1ec")
							$".".get_child(4).modulate = Color("92d1ec")
							$".".get_child(5).modulate = Color("92d1ec")
							$".".get_child(6).modulate = Color("92d1ec")
							$".".get_child(7).modulate = Color("92d1ec")
							$".".get_child(8).modulate = Color("92d1ec")
							get_parent().self_modulate = Color("0a70dd")
				else:
					print("white")
					$".".get_child(0).modulate = Color("FFFFFF")
					$".".get_child(1).modulate = Color("FFFFFF")
					$".".get_child(2).modulate = Color("FFFFFF")
					$".".get_child(3).modulate = Color("FFFFFF")
					$".".get_child(4).modulate = Color("FFFFFF")
					$".".get_child(5).modulate = Color("FFFFFF")
					$".".get_child(6).modulate = Color("FFFFFF")
					$".".get_child(7).modulate = Color("FFFFFF")
					$".".get_child(8).modulate = Color("FFFFFF")
					print(get_parent().self_modulate)
					#get_parent().self_modulate = Color("FFFFFF")
					print(get_parent().self_modulate)
				test = true
				lastDimension = get_parent().currentDimension
		if(get_parent().currentDimension != lastDimension):
			test=false
