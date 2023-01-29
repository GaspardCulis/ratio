extends CanvasLayer


onready var Checkpoints = $Panel/VBoxContainer/Checkpoints/Vbox
onready var TimeLabel = $Panel/VBoxContainer/Timer/HBox/Time
onready var TimeMillisLabel = $Panel/VBoxContainer/Timer/HBox/TimeMillis

var globalTime := 0.0
var running := false
var currentLevel := ""

func _ready():
	randomize()
	self.visible = Global.speedrun
	update_time()

func _process(delta):
	if running:
		globalTime += delta
		update_time()


func start():
	globalTime = 0.0
	running = true

func stop():
	running = false

func reset():
	var ite = get_node("Panel/VBoxContainer/Checkpoints/Vbox").get_child_count() - 1
	while ite >=0:
		get_node("Panel/VBoxContainer/Checkpoints/Vbox").get_child(ite).queue_free()
		ite -= 1
var lastTime = -1
func create_checkpoint(name: String, secure := true):
	if globalTime - lastTime > 0.5 or lastTime < 0:
		print("Create checkpoint for ", name)
		lastTime = globalTime
		_create_checkpoint(name, (randf() - 0.5)*5, globalTime)

func update_time():
	var tts = time_to_string(globalTime)
	TimeLabel.text = tts.substr(0, tts.length() - 3)
	TimeMillisLabel.text = tts.substr(tts.length() - 3)
	

func _create_checkpoint(name: String, timeDiff: float, time: float):
	var out = HBoxContainer.new()
	
	var nameL = Label.new()
	nameL.text = name
	nameL.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	var timeDiffL = Label.new()
	timeDiffL.text = time_diff(timeDiff)
	if timeDiff < 0:
		timeDiffL.add_color_override("font_color", Color(0.8, 0.2, 0.2))
	else:
		timeDiffL.add_color_override("font_color", Color(0.2, 0.8, 0.2))
	
	var timeL = Label.new()
	timeL.text = time_to_string(time)
	
	out.add_child(nameL)
	out.add_child(timeDiffL)
	out.add_child(timeL)
	
	Checkpoints.add_child(out)

func time_to_string(time: float) -> String:
	var out = ""
	
	var minutes = int(time / 60)
	var seconds = int(int(time) % 60)
	var milliseconds = int((time - int(time)) * 100)
	
	out += str(minutes) + ":"
	if seconds < 10:
		out += "0"
	out += str(seconds) + "."
	if milliseconds < 10:
		out += "0"
	out += str(milliseconds)
	
	return out


func time_diff(timeDiff: float) -> String:
	var out = ""
	
	if timeDiff < 0:
		out += "-"
	else:
		out += "+"
	
	var minutes = abs(int(timeDiff / 60))
	var seconds = abs(int(int(timeDiff) % 60))
	var milliseconds = abs(int((timeDiff - int(timeDiff)) * 100))
	
	if int(timeDiff/60):
		out += str(minutes) + ":"
	out += str(seconds) + "."
	if milliseconds < 10:
		out += "0"
	out += str(milliseconds)
	
	return out
