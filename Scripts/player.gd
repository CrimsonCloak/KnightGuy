extends CharacterBody2D

# Required scenes
@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = %GameManager
@onready var sword = $Sword

# Variables
const JUMP_VELOCITY = -250.0
var MAX_JUMPS = 1
var SPEED
var WALKING_SPEED = 100.0
var SPRINT_UNLOCKED = false
var SPRINT_SPEED = 150.0

# External variables
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Derived variables
var jumps_left = MAX_JUMPS  # Remaining jumps

# Unlockable thresholds - coins
var unlock_sprint = 2
var unlock_doublejump = 5

# Make sword visible

func _physics_process(delta):
	
	# Unlocks and upgrades
	
	if game_manager.coins >= 5:
		SPRINT_UNLOCKED = true
		
	if game_manager.coins >= 10:
		MAX_JUMPS = 2
		
	if game_manager.swordCollected == true:
		sword.visible = true
		
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Reset jumps when on the floor
	if is_on_floor():
		jumps_left = MAX_JUMPS

	# Handle Jump.
	if Input.is_action_just_pressed("Jump"):
		if jumps_left > 0:
			velocity.y = JUMP_VELOCITY
			jumps_left -= 1

	# Movement
	var direction = Input.get_axis("Move_left", "Move_right")
	
	# Sprint - unlocked after 
	if Input.is_action_pressed("Sprint") and SPRINT_UNLOCKED == true:
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


	
func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		game_manager.handle_pause_game()

		

