extends "res://Game/Shop/LockedTemplate/LockedTemplate.gd"

func _ready():
	set_path("res://Game/Camp/Trainer/Trainer.tscn")
	set_shop_items(ShopData.LockedPerks)
	items.instantiate_all_items()

