extends "res://Game/Items/Baits/BaitTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["Bait"])
	set_item_name("Bait")
	update_qty_of_bait()
