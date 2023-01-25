tool
extends Area2D

const Player = preload("res://scenes/Player/Player.gd")
export(NodePath) var BarrierePath
onready var Bariere = get_node(BarrierePath)

var checkList = [false,false,false,false,false,false]
var winnable = true
const correctList = [ "''","[","/" ]
var symbolChosen

func _ready():
	$KeyHint.visible = false
	$Symbol1.visible = false
	$Symbol2.visible = false
	$Symbol3.visible = false
	$Value1.visible = false
	$Value2.visible = false
	$Value3.visible = false

var penetration := false

func setSymbolDisabled():
	$Symbol1.disabled = true
	$Symbol2.disabled = true
	$Symbol3.disabled = true

func setSymbolEnabled():
	$Symbol1.disabled = (checkList[0] != false)
	$Symbol2.disabled = (checkList[1] != false)
	$Symbol3.disabled = (checkList[2] != false)
	if(checkList[0] and checkList[1] and checkList[2]):
		if(winnable):
			Bariere.queue_free()
		else:
			checkList = [false,false,false,false,false,false]
	get_tree().get_nodes_in_group("player")[0].bouger = true
func setValueDisabled():
	$Value1.disabled = true
	$Value2.disabled = true
	$Value3.disabled = true

func setValueEnabled():
	$Value1.disabled = (checkList[3] != false)
	$Value2.disabled = (checkList[4] != false)
	$Value3.disabled = (checkList[5] != false)

func _input(event):
	if penetration and Input.is_action_just_pressed("action"):
		$KeyHint.visible = false
		
		$Symbol1.visible = true
		$Symbol2.visible = true
		$Symbol3.visible = true
		$Value1.visible = true
		$Value2.visible = true
		$Value3.visible = true
		setValueDisabled()
		setSymbolEnabled()


func _on_Symbol1_pressed():
	checkList[0] = true
	symbolChosen = "/"
	setSymbolDisabled()
	setValueEnabled()
	


func _on_Symbol2_pressed():
	checkList[1] = true
	symbolChosen = "''"
	setSymbolDisabled()
	setValueEnabled()
	


func _on_Symbol3_pressed():
	checkList[2] = true
	symbolChosen = "["
	setSymbolDisabled()
	setValueEnabled()
	


func _on_Value1_pressed():
	checkList[3] = true
	if(correctList[0] != symbolChosen):
		winnable = false
	setValueDisabled()
	setSymbolEnabled()

func _on_Value2_pressed():
	checkList[4] = true
	if(correctList[1] != symbolChosen):
		winnable = false
	setValueDisabled()
	setSymbolEnabled()

func _on_Value3_pressed():
	checkList[5] = true
	if(correctList[2] != symbolChosen):
		winnable = false
	setValueDisabled()
	setSymbolEnabled()

func _on_CablesChallenge_body_entered(body):
	if body is Player:
		penetration = true
		$KeyHint.visible = true

func _on_CablesChallenge_body_exited(body):
		if body is Player:
			penetration = false
			$KeyHint.visible = false
