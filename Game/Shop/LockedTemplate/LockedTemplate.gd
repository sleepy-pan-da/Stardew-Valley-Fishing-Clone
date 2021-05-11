extends Control

var path = ""

onready var items = $LockedItems/Items

func _on_GoBackToMenuButton_pressed():
	get_tree().change_scene(path)
	
func set_path(desired_path):
	path = desired_path

func set_shop_items(desired_shop):
	items.locked_shop_items = desired_shop
