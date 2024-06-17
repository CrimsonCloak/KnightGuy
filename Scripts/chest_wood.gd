extends Area2D

@onready var game_manager = %GameManager
@onready var animated_sprite = $AnimatedSprite2D
@onready var audio_stream_player = $AudioStreamPlayer2D

var opened = false


func _on_body_entered(body):
	if opened == false:
		opened = true
		animated_sprite.play("open")
		audio_stream_player.play()
		game_manager.pickup_sword()

		
