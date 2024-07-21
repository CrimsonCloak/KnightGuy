extends Node2D

@onready var animator: AnimationPlayer = $CanvasLayer/PauseMenu/AnimationPlayer
@onready var unpause_button: Button = $CanvasLayer/PauseMenu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/UnpauseButton
@onready var quit_button: Button = $CanvasLayer/PauseMenu/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready():
	unpause_button.pressed.connect(unpause)
	quit_button.pressed.connect(get_tree().quit)

func unpause():
	animator.play("Unpause")
	get_tree().paused = false
	queue_free()
	
func quit():
	get_tree().quit	
	
func pause():
	animator.play("Pause")
	get_tree().paused = true
