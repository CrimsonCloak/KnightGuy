extends CanvasLayer

@onready var coin_icon = $CoinCounterContainer/CoinIcon
@onready var coin_label = $CoinCounterContainer/CoinLabel

func update_coin_count(coin_count):
	coin_label.text = ": %d" % coin_count
