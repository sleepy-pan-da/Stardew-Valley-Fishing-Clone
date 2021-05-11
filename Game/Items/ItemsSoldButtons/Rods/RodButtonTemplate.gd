extends "res://Game/UI/BuyItemButtonTemplate.gd"

var shop_name

func add_to_inventory():
	PlayerData.add_to_inventory("rods", item_name)
	#remove rod from dictionary
	var shop_dict = ShopData.return_shop_dictionary(shop_name)
	ShopData.remove_item_from_shop(shop_dict, item_name)

func execute_button_behaviour():
	add_to_inventory()

func set_shop_name(new_shop_name):
	shop_name = new_shop_name
