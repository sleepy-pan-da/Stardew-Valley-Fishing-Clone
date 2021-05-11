extends "res://Game/UI/BuyItemButtonTemplate.gd"

func _ready():
	set_monetary_value(ItemData.ItemValue["YouWin"])
	set_item_name("You win?")
	update_text_on_button()

func execute_button_behaviour():
	get_tree().change_scene("res://Game/Items/ItemsSoldButtons/YouWin/YouWinScreen.tscn")
