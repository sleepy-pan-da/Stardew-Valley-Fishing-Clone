extends "res://Game/Shop/ShopTemplate.gd"

func _ready():
	set_path("res://Game/Camp/BaitShop/BaitShop.tscn")
	set_shop_items(ShopData.BaitShop)
	items.instantiate_all_items()

