extends VBoxContainer

var locked_shop_items

func instantiate_all_items():
	for i in locked_shop_items:
		print(i)
		instantiate_an_item(i)

func instantiate_an_item(item_name):
	var item_resource = locked_shop_items[item_name]
	var item = item_resource.instance()
	add_child(item)

