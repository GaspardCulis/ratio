extends  "res://src/abstract/AbstractLevel.gd"
#extends TileMap


func _ready() :
	for i in $Controller.get_children() :
		i.connect("retrieved", self, "RetrieveAllFragments")
	
	$"Fragments-count".visible = false
	$"Animation_Door".frame = 1
	yield(get_tree().create_timer(1), "timeout")
	$"Animation_Door".frame = 0
		
func RetrieveAllFragments() : 
	#var isAllRetrieved:bool = false
	var count = 0
	
	for i in $Controller.get_children() :
		if (i.visible == false) :
			#print(i.is_visible_in_tree())
			count = count + 1
			$"Fragments-count".visible = true
			$"Fragments-count".frame = count - 1
			#print(count)
	
	if count == 5 :
		#isAllRetrieved = true 
		$"Animation_Watch".play("default")
		$"Animation_Watch".visible = false
		
#rajouter petit son a chaque fois que morceau recupere
#rajouter porte fin niveau
#rajouter instructions lorsque perso devant sign ?
#rajouter contour jaune autour des fragments
#rajouter compteur de fragments dès que premier ramassé
