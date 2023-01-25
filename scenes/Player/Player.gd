extends KinematicBody2D

export var MASS := 1500
export var SPEED := 300
export var ACCEL_TIME := 8
export var JUMP_SPEED := 500

onready var AnimationSprite = $AnimatedSprite
onready var animationNames = AnimationSprite.frames.get_animation_names()
onready var Cam = $Camera2D
var bouger = true
var DEAD = false
var spawnpoint: Vector2

enum animationStates {
	DEATH = 0,
	IDLE = 1,
	JUMP = 2,
	LANDS = 3,
	RUN = 4
}

var velocity = Vector2.ZERO


func _ready():
	pass

func _physics_process(delta):
	if(!DEAD):
		var inputs := get_inputs()
		handle_physics(inputs, delta)
		handle_animation(inputs)
		handle_sounds(inputs)
		handle_inputs(inputs, delta)
		
		velocity = move_and_slide(velocity, Vector2.UP, false, 4, PI/2 * 0.9)
	

func get_inputs() -> Vector2:
	if not bouger:
		return Vector2.ZERO
	return Vector2(Input.get_action_strength("droite") - Input.get_action_strength("gauche"), Input.get_action_strength("saut") - Input.get_action_strength("bas"))

func handle_physics(inputs: Vector2, delta: float) -> void:
	if !is_on_floor():
		if inputs.y > 0 and velocity.y < 0:
			velocity.y += MASS * 0.5 * delta
		else:
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

const grass_sounds := [
	preload("res://assets/soundeffects/step/grass1.ogg"),
	preload("res://assets/soundeffects/step/grass2.ogg"),
	preload("res://assets/soundeffects/step/grass3.ogg"),
	preload("res://assets/soundeffects/step/grass4.ogg"),
	preload("res://assets/soundeffects/step/grass5.ogg"),
	preload("res://assets/soundeffects/step/grass6.ogg")
]
const stone_sounds := [
	preload("res://assets/soundeffects/step/stone1.ogg"),
	preload("res://assets/soundeffects/step/stone2.ogg"),
	preload("res://assets/soundeffects/step/stone3.ogg"),
	preload("res://assets/soundeffects/step/stone4.ogg"),
	preload("res://assets/soundeffects/step/stone5.ogg"),
	preload("res://assets/soundeffects/step/stone6.ogg")
]
var stepping_on_stone := false
func handle_sounds(inputs: Vector2) -> void:
	if not $AudioStreamPlayer2D.playing and is_on_floor() and inputs.x:
		$AudioStreamPlayer2D.stream = [grass_sounds, stone_sounds][int(stepping_on_stone)][randi()%grass_sounds.size()]
		$AudioStreamPlayer2D.play()
		 

func is_landing() -> bool:
	return AnimationSprite.animation == animationNames[animationStates.LANDS] and AnimationSprite.frame < 3

func get_camera() -> Camera2D:
	return Cam
	
func kill():
	if(!DEAD and bouger):
		DEAD = true
		AnimationSprite.animation = animationNames[animationStates.DEATH]
		yield(get_tree().create_timer(0.75), "timeout")
		global_position = spawnpoint
		AnimationSprite.animation = animationNames[animationStates.LANDS]
		DEAD = false


func _on_VisibilityNotifier2D_screen_exited():
	kill()
