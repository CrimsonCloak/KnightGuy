extends Node

# Player upgrades

var swordCollected = false
var paused = false
# Coin responsibilities
var coins = 0
@onready var coin_counter = $CoinCounter


func add_coin():
	coins += 1
	coin_counter.get_child(0).update_coin_count(coins)
	
func handle_pause_game():
		if get_tree().paused:
			get_tree().paused = false
		else: 
			add_child(load("res://Scenes/Menu's/pause_menu.tscn").instantiate())
			get_tree().paused = true
func pickup_sword():
	swordCollected = true
