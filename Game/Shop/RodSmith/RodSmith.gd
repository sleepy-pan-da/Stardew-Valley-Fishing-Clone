extends "res://Game/Shop/ShopTemplate.gd"

func _ready():
	#set_path("res://Game/Camp/RodSmith/RodSmith.tscn")
	set_shop_items(ShopData.RodSmith)
	items.instantiate_all_items()

