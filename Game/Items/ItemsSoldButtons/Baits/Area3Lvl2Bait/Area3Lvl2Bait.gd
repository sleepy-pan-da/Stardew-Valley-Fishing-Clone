extends "res://Game/Items/ItemsSoldButtons/Baits/BaitButtonTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["Area3Lvl2bait"])
	set_item_name("Area3Lvl2bait")
	update_text_on_button()


