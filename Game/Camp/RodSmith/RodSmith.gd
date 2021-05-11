extends "res://Game/Camp/CampShopTemplate.gd"





func _on_BuyRodsButton_pressed():
	get_tree().change_scene("res://Game/Shop/RodSmith/RodSmith.tscn")


func _on_LockedRodsButton_pressed():
	get_tree().change_scene("res://Game/Shop/RodSmith/LockedRods.tscn")
