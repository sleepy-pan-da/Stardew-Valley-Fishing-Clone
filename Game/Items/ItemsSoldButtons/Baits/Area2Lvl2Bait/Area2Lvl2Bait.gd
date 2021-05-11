extends "res://Game/Items/ItemsSoldButtons/Baits/BaitButtonTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["Area2Lvl2bait"])
	set_item_name("Area2Lvl2bait")
	update_text_on_button()


