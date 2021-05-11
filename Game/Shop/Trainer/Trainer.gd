extends "res://Game/Shop/ShopTemplate.gd"

func _ready():
	#set_path("res://Game/Camp/Trainer/Trainer.tscn")
	set_shop_items(ShopData.Trainer)
	items.instantiate_all_items()

