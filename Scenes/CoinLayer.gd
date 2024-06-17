extends CanvasLayer

@onready var coin_label = $CoinLabel

func update_coin_count(coin_count):
	coin_label.text = "Coins: %d" % coin_count
