extends CharacterBody2D

const SPEED = 75
const JUMP_VELOCITY = -150

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: float

@onready var camera: Camera2D = $"../Camera2D"

@onready var jump_timer: Timer = $JumpTimer
@onready var animation: AnimationPlayer = $AnimationPlayer

signal dash_start
signal shake_start

var jump_ready: bool = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_ready:
		if direction == -1:
			animation.play("jump_left")
		else:
			animation.play("jump_right")
		velocity.y = JUMP_VELOCITY
		dash_start.emit()
		jump_timer.start()
		jump_ready = false
		shake_start.emit()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction == -1:
			animation.play("run_left")
		if direction == 1:
			animation.play("run_right")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_jump_timer_timeout():
	jump_ready = true
	
func hit():
	Globals.all_time -= Globals.hit_value
