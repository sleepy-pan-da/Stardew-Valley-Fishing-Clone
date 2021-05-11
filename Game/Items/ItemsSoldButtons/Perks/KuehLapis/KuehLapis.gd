extends "res://Game/Items/ItemsSoldButtons/Perks/BuyPerkTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["KuehLapis"])
	set_item_name("KuehLapis")
	update_text_on_button()
	set_shop_name("ShopThree")

