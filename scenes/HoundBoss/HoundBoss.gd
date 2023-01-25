extends KinematicBody2D

export var MASS := 1500
export var WALK_SPEED := 100
export var JUMP_SPEED := 500
export var HP := 100

enum animationStates {
	IDLE = 0,
	JUMP = 1,
	RUN = 2,
	WALK = 3
}

enum attackState {
	CHILL = 0,
	ATTACK = 1
}

var currentState = 0
var currentAttackState = 0
var lookingAt = 1
var velocity := Vector2.ZERO

onready var AnimationSprite = $AnimatedSprite
onready var Inputs = $Inputs
onready var VoidRaycast = $Inputs/Void
onready var GroundRaycast = $Inputs/Ground
onready var WallRaycast = $Inputs/Wall
onready var animationNames = AnimationSprite.frames.get_animation_names()

func wait_random():
	yield(get_tree().create_timer(randi()%4 + 1), "timeout")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_state(animationStates.IDLE)
	yield(wait_random(), "completed")
	change_state()
	get_tree().connect("tree_changed", self, "_on_tree_changed")
	
	var nodes = get_tree().get_nodes_in_group("player")
	if nodes.size() > 0:
		player = nodes[0]

var player: KinematicBody2D = null
func _on_tree_changed():
	if !get_tree():return
	var nodes = get_tree().get_nodes_in_group("player")
	if nodes.size() > 0:
		player = nodes[0]

func change_state():
	# Logic
	# State
	if currentAttackState:
		handle_attack_state()
	else:
		set_direction(sign(randf() - 0.5))
		if randf() > 0.8:
			set_state(animationStates.IDLE)
		else:
			set_state(animationStates.WALK)
	
	# NExt
	yield(wait_random(), "completed")
	change_state()
	
func handle_attack_state():
	set_state(animationStates.RUN)
	set_direction(sign(self.global_position.x - player.global_position.x))

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += MASS * delta
		
	if self.currentState in [animationStates.WALK, animationStates.RUN]:
		if self.currentState == animationStates.WALK:
			velocity.x = -self.WALK_SPEED * self.lookingAt
		else:
			velocity.x = -self.WALK_SPEED * self.lookingAt * 3
		if !VoidRaycast.get_collider():
			set_direction(-lookingAt)
	elif self.currentState == animationStates.JUMP:
		velocity.x = -self.WALK_SPEED * self.lookingAt * 0.8
	else:
		velocity.x = 0
		
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0)
	
	if WallRaycast.get_collider():
		if currentAttackState:
			set_direction(-lookingAt)
		else:
			set_state(animationStates.IDLE)
		
	if player and self.global_position.distance_to(player.global_position) < 8500 :
		currentAttackState = attackState.ATTACK
	else:
		currentAttackState = attackState.CHILL
	
		
		


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


func _on_HagraZone_body_entered(body: PhysicsBody2D):
	if body and body.has_method("kill"):
		body.kill()
		
func damage():
	HP = max(0, HP - 10)
	var tween := create_tween()
	tween.tween_property(self, "modulate", Color.red, 0.2)
	tween.play()
	yield(tween, "finished")
	tween.stop()
	tween.tween_property(self, "modulate", Color.white, 0.2)
	tween.play()
