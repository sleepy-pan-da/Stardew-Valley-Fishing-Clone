extends "res://Game/Items/ItemsSoldButtons/Perks/BuyPerkTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["FishMonger"])
	set_item_name("FishMonger")
	update_text_on_button()
	set_shop_name("ShopOne")

