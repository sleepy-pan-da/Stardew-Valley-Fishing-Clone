extends "res://Game/Shop/LockedTemplate/LockedTemplate.gd"

func _ready():
	set_path("res://Game/Camp/RodSmith/RodSmith.tscn")
	set_shop_items(ShopData.LockedRodSmith)
	items.instantiate_all_items()

