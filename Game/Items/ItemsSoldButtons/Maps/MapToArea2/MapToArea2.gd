extends "res://Game/Items/ItemsSoldButtons/Maps/MapTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["MapToArea2"])
	set_item_name("MapToArea2")
	update_text_on_button()

func unlock_access_to_area():
	AreaData.unlock_area("Area2")
	
