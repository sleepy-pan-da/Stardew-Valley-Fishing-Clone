extends "res://Game/Items/MapTemplate/MapTemplate.gd"

func _ready():
	var name = "TheLake"
	set_monetary_value(ItemData.ItemValue[name])
	set_item_name(name)
	if AreaData.UnlockedAreas[name]:
		update_buy_button_state()
