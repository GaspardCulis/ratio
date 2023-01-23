extends KinematicBody2D

export var MASS := 2000
export var SPEED := 700
export var ACCEL_TIME := 8
export var JUMP_SPEED := 400

var velocity = Vector2.ZERO


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	handle_physics(delta)
	handle_inputs(delta)
	
	velocity = move_and_slide(velocity, Vector2.UP)


func handle_physics(delta: float) -> void:
	if !is_on_floor():
		velocity.y += MASS * delta
	
var old_double_jumped := false
var has_double_jumped := false
var double_jumped := false
func handle_inputs(delta: float) -> void:
	var input = Vector2(Input.get_action_strength("droite") - Input.get_action_strength("gauche"), Input.get_action_strength("saut") - Input.get_action_strength("bas"))
	if input.x:
		velocity.x = lerp(float(velocity.x), float(SPEED*sign(input.x)), ACCEL_TIME * delta)
	else:
		velocity.x = lerp(velocity.x, 0, ACCEL_TIME * delta * 2)
	old_double_jumped = double_jumped
	if input.y>0:
		if is_on_floor():
			double_jumped = false
			has_double_jumped = false
			
			velocity.y = -JUMP_SPEED
		
		elif not double_jumped and not has_double_jumped:
			double_jumped = true
			velocity.y -= JUMP_SPEED
	elif input.y < 0:
		if not is_on_floor():
			double_jumped = false
			has_double_jumped = true
