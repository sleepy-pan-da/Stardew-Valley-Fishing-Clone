extends "res://Game/Items/UnlockedPerks/PerkTemplate.gd"

func _ready():
	var perk_name = "FishMonger"
	set_monetary_value(ItemData.ItemValue[perk_name])
	set_item_name(perk_name)
	if PerkData.check_if_perk_is_unlocked(perk_name):
		update_buy_button_state()
