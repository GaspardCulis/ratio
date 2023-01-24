extends KinematicBody2D

export var MASS := 1500
export var WALK_SPEED := 100
export var JUMP_SPEED := 500

enum animationStates {
	IDLE = 0,
	JUMP = 1,
	RUN = 2,
	WALK = 3
}

var currentState = 0
var lookingAt = 1
var velocity := Vector2.ZERO

onready var AnimationSprite = $AnimatedSprite
onready var Inputs = $Inputs
onready var VoidRaycast = $Inputs/Void
onready var GroundRaycast = $Inputs/Ground
onready var animationNames = AnimationSprite.frames.get_animation_names()

func wait_random():
	yield(get_tree().create_timer(randi()%4 + 1), "timeout")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_state(animationStates.IDLE)
	yield(wait_random(), "completed")
	change_state()

func change_state():
	# Logic
	#Direction
	set_direction(sign(randf() - 0.5))
	# State
	if randf() > 0.8:
		set_state(animationStates.IDLE)
	else:
		set_state(animationStates.WALK)
	
	
	
	# NExt
	yield(wait_random(), "completed")
	change_state()

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += MASS * delta
		
	if self.currentState == animationStates.WALK:
		velocity.x = -self.WALK_SPEED * self.lookingAt
		if !VoidRaycast.get_collider():
			set_direction(-lookingAt)
	elif self.currentState == animationStates.JUMP:
		velocity.x = -self.WALK_SPEED * self.lookingAt * 0.8
	else:
		velocity.x = 0
		
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0)
	
	if velocity.x == 0:
		set_state(animationStates.IDLE)
	
		
		


var old_state: int
var penetration := 0
func _on_FrontCollision_body_entered(body):
	if !(body is TileMap) or !GroundRaycast.get_collider():
		return
	penetration+=1
	if currentState != animationStates.JUMP:
		old_state = currentState
	set_state(animationStates.JUMP)
	velocity.y = -JUMP_SPEED
	yield(AnimationSprite, "animation_finished")
	set_state(old_state)

func set_direction(direction):
	self.lookingAt = direction
	AnimationSprite.scale.x = direction
	Inputs.scale.x = direction
	
func set_state(state):
	if AnimationSprite.animation != animationNames[state]:
		AnimationSprite.frame = 0
	AnimationSprite.animation = animationNames[state]
	currentState = state
