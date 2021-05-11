extends "res://Game/Shop/ShopTemplate.gd"

func _ready():
	#set_path("res://Game/Camp/Cartographer/Cartographer.tscn")
	set_shop_items(ShopData.Cartographer)
	items.instantiate_all_items()

