extends "res://Game/Items/ItemsSoldButtons/Baits/BaitButtonTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["Bait"])
	set_item_name("Bait")
	update_text_on_button()


