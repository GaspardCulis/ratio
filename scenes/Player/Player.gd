extends KinematicBody2D

export var MASS := 1000
export var SPEED := 300
export var ACCEL_TIME := 8
export var JUMP_SPEED := 800

onready var AnimationSprite = $AnimatedSprite
onready var animationNames = AnimationSprite.frames.get_animation_names()

enum animationStates {
	IDLE = 0,
	JUMP = 1,
	RUN = 2
}

var velocity = Vector2.ZERO


func _ready():
	pass

func _physics_process(delta):
	var inputs := get_inputs()
	handle_physics(delta)
	handle_inputs(inputs, delta)
	handle_animation(inputs)
	
	velocity = move_and_slide(velocity, Vector2.UP)

func get_inputs() -> Vector2:
	return Vector2(Input.get_action_strength("droite") - Input.get_action_strength("gauche"), Input.get_action_strength("saut") - Input.get_action_strength("bas"))

func handle_physics(delta: float) -> void:
	if !is_on_floor():
		velocity.y += MASS * delta
	
var old_double_jumped := false
var has_double_jumped := false
var double_jumped := false
func handle_inputs(inputs: Vector2, delta: float) -> void:
	if inputs.x:
		velocity.x = lerp(float(velocity.x), float(SPEED*sign(inputs.x)), ACCEL_TIME * delta)
	else:
		velocity.x = lerp(velocity.x, 0, ACCEL_TIME * delta * 2)
	old_double_jumped = double_jumped
	if inputs.y>0:
		if is_on_floor():
			double_jumped = false
			has_double_jumped = false
			
			velocity.y = -JUMP_SPEED

func handle_animation(inputs: Vector2) -> void:
	if (AnimationSprite.animation == animationNames[animationStates.JUMP] and !is_on_floor()) or (inputs.y > 0 and is_on_floor()):
		AnimationSprite.animation = animationNames[animationStates.JUMP]
	elif inputs.x:
		AnimationSprite.animation = animationNames[animationStates.RUN]
	else:
		AnimationSprite.animation = animationNames[animationStates.IDLE]
	# Direction
	if inputs.x:
		AnimationSprite.scale.x = sign(inputs.x)
