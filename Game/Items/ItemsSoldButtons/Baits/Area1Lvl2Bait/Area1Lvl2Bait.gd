extends "res://Game/Items/ItemsSoldButtons/Baits/BaitButtonTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["Area1Lvl2bait"])
	set_item_name("Area1Lvl2bait")
	update_text_on_button()


