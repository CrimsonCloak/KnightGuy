extends Node2D

const SPEED = 30

var direction = 1
@onready var raycast_left = $RaycastLeft
@onready var raycast_right = $RaycastRight
@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = %GameManager
@onready var killzone = $Killzone

var killable = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Killable
	if game_manager.swordCollected == true and killable == false:
		killable = true
		killzone.queue_free()
		
		
	
	
	# Walking
	# When hits a wall on the right side, turn direction to left and flip sprite
	if raycast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
# When hits a wall on the left side, turn direction to right and flip sprite			
	if raycast_left.is_colliding():
			direction = 1	
			animated_sprite.flip_h = false
	position.x += direction * SPEED * delta


