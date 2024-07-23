extends Area2D

@onready var game_manager = %GameManager
@onready var animated_sprite = $AnimatedSprite2D
@onready var audio_stream_player = $AudioStreamPlayer2D


var opened = false
var lootOption = [1, 3, 15]
var rng = RandomNumberGenerator.new()

func _on_body_entered(body):
	if opened == false:
		opened = true
		open_chest()
		

func open_chest():
		animated_sprite.play("open")
		audio_stream_player.play()
		game_manager.pickup_sword()
		game_manager.add_coin(lootOption[rng.randi_range(0,2)])
		
