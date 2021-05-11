extends "res://Game/Shop/ButtonsForItems.gd"


func instantiate_all_items():
	for i in shop_items:
		if ItemData.check_if_perk_blueprint_is_unlocked(i):
			instantiate_an_item(i)
