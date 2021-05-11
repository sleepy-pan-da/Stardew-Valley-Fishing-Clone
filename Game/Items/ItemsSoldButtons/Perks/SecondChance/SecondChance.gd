extends "res://Game/Items/ItemsSoldButtons/Perks/BuyPerkTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["SecondChance"])
	set_item_name("SecondChance")
	update_text_on_button()
	set_shop_name("ShopThree")

