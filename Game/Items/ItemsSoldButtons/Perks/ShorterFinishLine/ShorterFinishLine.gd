extends "res://Game/Items/ItemsSoldButtons/Perks/BuyPerkTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["ShorterFinishLine"])
	set_item_name("ShorterFinishLine")
	update_text_on_button()
	set_shop_name("ShopThree")

