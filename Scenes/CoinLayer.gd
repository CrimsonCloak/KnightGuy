extends CanvasLayer

@onready var coin_icon = $MarginContainer/HBoxContainer/CoinIcon
@onready var coin_label = $MarginContainer/HBoxContainer/CoinLabel

func update_coin_count(coin_count):
	coin_label.text = ": %d" % coin_count
