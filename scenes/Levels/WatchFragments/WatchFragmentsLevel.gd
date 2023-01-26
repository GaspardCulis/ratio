extends  "res://src/abstract/AbstractLevel.gd"

export var portePath: NodePath
onready var porte = get_node(portePath)

var count = 0
var isWatchRetrieved = false

func _ready() :
	for i in $Controller.get_children() :
		i.connect("retrieved", self, "RetrieveAllFragments")
	$"Animation_Door".frame = 1
	yield(get_tree().create_timer(1), "timeout")
	$"Animation_Door".frame = 0
		
func RetrieveAllFragments(index: int) :
	if ($Controller.get_child(index).visible == true) :
		Hud.show_or_increment_counter()
		count = count + 1
	
	if (count == 5 and !isWatchRetrieved) :
		isWatchRetrieved = true
		Hud.close_counter_overlay()
		Hud.show_and_animate_watch()
		porte.set_opened(true)
		
#rajouter instructions lorsque perso devant sign 
