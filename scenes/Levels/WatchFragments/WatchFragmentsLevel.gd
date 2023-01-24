extends  "res://src/abstract/AbstractLevel.gd"
#extends TileMap

func _ready() :
	for i in $Controller.get_children() :
		i.connect("retrieved", self, "RetrieveAllFragments")
		
func RetrieveAllFragments() : 
	var isAllRetrieved:bool = false
	var count = 0
	
	for i in $Controller.get_children() :
		if (!i.is_visible()) :
			count = count + 1
			print(count)
	
	if count == 5 :
		isAllRetrieved = true 
		
#rajouter petit son a chaque fois que morceau recupere
#rajouter countdown timer
#rajouter porte
#rajouter instructions lorsque perso devant sign
