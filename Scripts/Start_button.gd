extends Button

func _pressed():
	print("Starting game")
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
