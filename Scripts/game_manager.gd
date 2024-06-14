extends Node

var coins = 0
@onready var coin_counter = $"Coin counter"

var coins_score_string = "Coins collected: {str}"

func add_coin():
	coins += 1
	coin_counter.text = coins_score_string.format({"str": str(coins)})
