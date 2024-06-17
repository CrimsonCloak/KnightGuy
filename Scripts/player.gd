extends CharacterBody2D

const MAX_JUMPS = 2
const JUMP_VELOCITY = -250.0
var SPEED
var WALKING_SPEED = 100.0
var SPRINT_SPEED = 200.0

@onready var animated_sprite = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Derived from CONST variables for use
var jumps_left = MAX_JUMPS  # Remaining jumps

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Reset jumps when on the floor
	if is_on_floor():
		jumps_left = MAX_JUMPS

	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1

	# Movement
	var direction = Input.get_axis("Move_left", "Move_right")
	
	# Sprint
	if Input.is_action_pressed("Sprint"):
		SPEED = SPRINT_SPEED
	else:
		SPEED = WALKING_SPEED

	# Sprite flip
	# One-liner but defaults to looking to one specific direction
	#animated_sprite.flip_h = true if (direction < 0) else false
	
	# Longer script but doesn't default to any sprite direction, only latest
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true	
	
	# Animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


