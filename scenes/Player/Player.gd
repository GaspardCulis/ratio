extends KinematicBody2D

export var MASS := 1000
export var SPEED := 300
export var ACCEL_TIME := 8
export var JUMP_SPEED := 600

onready var AnimationSprite = $AnimatedSprite
onready var animationNames = AnimationSprite.frames.get_animation_names()

enum animationStates {
	IDLE = 0,
	JUMP = 1,
	LANDS = 2,
	RUN = 3
}

var velocity = Vector2.ZERO


func _ready():
	pass

func _physics_process(delta):
	var inputs := get_inputs()
	handle_physics(delta)
	handle_animation(inputs)
	handle_inputs(inputs, delta)
	
	velocity = move_and_slide(velocity, Vector2.UP)

func get_inputs() -> Vector2:
	return Vector2(Input.get_action_strength("droite") - Input.get_action_strength("gauche"), Input.get_action_strength("saut") - Input.get_action_strength("bas"))

func handle_physics(delta: float) -> void:
	if !is_on_floor():
		velocity.y += MASS * delta

func handle_inputs(inputs: Vector2, delta: float) -> void:
	if not inputs.x:
		velocity.x = lerp(velocity.x, 0, ACCEL_TIME * delta * 2)
	elif is_landing():
		velocity.x = lerp(velocity.x, 0, ACCEL_TIME * delta * 0.2)
	else:
		velocity.x = lerp(float(velocity.x), float(SPEED*sign(inputs.x)), ACCEL_TIME * delta)
		
	if inputs.y>0:
		if is_on_floor() and not is_landing():
			velocity.y = -JUMP_SPEED

func handle_animation(inputs: Vector2) -> void:
	if AnimationSprite.animation == animationNames[animationStates.JUMP]:
		if is_on_floor():
			AnimationSprite.animation = animationNames[animationStates.LANDS]
	elif is_landing():
		pass
	elif (inputs.y > 0 and is_on_floor()):
		AnimationSprite.animation = animationNames[animationStates.JUMP]
	elif inputs.x:
		AnimationSprite.animation = animationNames[animationStates.RUN]
	else:
		AnimationSprite.animation = animationNames[animationStates.IDLE]
	# Direction
	if inputs.x:
		AnimationSprite.scale.x = sign(inputs.x)

func is_landing() -> bool:
	return AnimationSprite.animation == animationNames[animationStates.LANDS] and AnimationSprite.frame < 3
