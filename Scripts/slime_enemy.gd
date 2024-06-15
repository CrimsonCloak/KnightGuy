extends Node2D

const SPEED = 30

var direction = 1
@onready var raycast_left = $RaycastLeft
@onready var raycast_right = $RaycastRight
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# When hits a wall on the right side, turn direction to left and flip sprite
	raycast_right.set_collision_mask_value(2, false)
	if raycast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
# When hits a wall on the left side, turn direction to right and flip sprite			
	raycast_left.set_collision_mask_value(2, false)
	if raycast_left.is_colliding():
			direction = 1	
			animated_sprite.flip_h = false
	position.x += direction * SPEED * delta


