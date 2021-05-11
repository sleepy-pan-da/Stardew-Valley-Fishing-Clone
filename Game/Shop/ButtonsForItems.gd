extends VBoxContainer

var shop_items

func instantiate_all_items():
	for i in shop_items:
		instantiate_an_item(i)

func instantiate_an_item(item_name):
	var item_resource = shop_items[item_name]
	var item = item_resource.instance()
	item.connect("buy_item", get_parent().get_parent(), "update_player_status")
	add_child(item)

