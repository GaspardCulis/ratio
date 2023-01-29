extends Node

onready var ResOptionBox = $VBoxContainer/VBoxContainer2/HBoxContainer3/OptionButton
onready var ShowFPSCheck = $VBoxContainer/VBoxContainer2/HBoxContainer/ShowFPSCheckbox

var Res:Dictionary = {
	"2560x1440":Vector2(2560,1440),
	"1920x1080":Vector2(1920,1080),
	"1280x720":Vector2(1280,720)
}


# Called when the node enters the scene tree for the first time.
func _ready():
	#AddRes()
	getFPS()
	if(Global.speedrun):
		get_node("VBoxContainer/VBoxContainer2/Speedrun/SpeedrunmodeCheck").pressed = true
	if(Global.cringe):
		get_node("VBoxContainer/VBoxContainer2/Cringe/CringeMode").pressed = true
	if(OS.window_fullscreen):
		get_node("VBoxContainer/VBoxContainer2/HBoxContainer2/FullScreen").pressed = true
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()
func AddRes():
	var CurrentRes = get_viewport().get_size()
	var index = 0
	for r in Res:
		ResOptionBox.add_item(r, index)
		if Res[r] == CurrentRes:
			ResOptionBox._select_int(index)
		index += 1
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()
func getFPS():
	ShowFPSCheck.pressed = get_node("/root/Global").showFPS
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Menus/StartMenu.tscn")

func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()


func _on_OptionButton_item_selected(index):
	var size = Res.get(ResOptionBox.get_item_text(index))
	OS.set_window_size(size)
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_KEEP, size)


func _on_ShowFPSCheckbox_pressed():
	get_node("/root/Global").showFPS = !get_node("/root/Global").showFPS
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()

func _on_SpeedrunmodeCheck_pressed():
	Global.speedrun = not Global.speedrun
	SpeedrunMonitor.visible = Global.speedrun
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()

func _on_CringeMode_toggled(button_pressed):
	Global.cringe = button_pressed
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()

func _on_Button_focus_entered():
	get_node("VBoxContainer/VBoxContainer/Button").grab_focus()
