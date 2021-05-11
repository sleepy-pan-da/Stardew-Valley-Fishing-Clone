extends "res://Game/UI/BuyConsumableButtonTemplate.gd"


func add_to_inventory():
	#PlayerData.add_to_bait_inventory(item_name)
	PlayerData.add_to_inventory("baits", item_name)
	
func execute_button_behaviour():
	add_to_inventory()


