extends "res://Game/Items/ItemsSoldButtons/Rods/RodButtonTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["AmateurRod"])
	set_item_name("AmateurRod")
	update_text_on_button()
	set_shop_name("ShopOne")
