extends Area2D

# We will use so-called 'signals' (~ triggers) that are built-in for Godot. You can see these in the Godot-editor under the node's signals tab, next to the inspector.

func _on_body_entered(body):
	print ("Got the coin!")
