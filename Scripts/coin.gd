extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

# We will use so-called 'signals' (~ triggers) that are built-in for Godot. You can see these in the Godot-editor under the node's signals tab, next to the inspector.
func _on_body_entered(body):
	game_manager.add_coin()
	animation_player.play("Collect")
