extends "res://Game/Items/ItemsSoldButtons/Perks/BuyPerkTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["TreasureHunter"])
	set_item_name("TreasureHunter")
	update_text_on_button()
	set_shop_name("ShopTwo")

