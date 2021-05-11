extends "res://Game/Camp/CampShopTemplate.gd"


func _on_BuyMapsButton_pressed():
	get_tree().change_scene("res://Game/Shop/Cartographer/Cartographer.tscn")
