extends "res://Game/Items/UnlockedRods/RodTemplate.gd"

func _ready():
	var name = "TrainingRod"
	set_monetary_value(ItemData.ItemValue[name])
	set_item_name(name)
	if ItemData.check_if_rod_is_unlocked(name):
		update_buy_button_state()
