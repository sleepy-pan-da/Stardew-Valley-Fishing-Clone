extends "res://Game/Camp/CampShopTemplate.gd"


func _on_SellFishButton_pressed():
	get_tree().change_scene("res://Game/Selling/Selling.tscn")


func _on_BuyStuffButton_pressed():
	get_tree().change_scene("res://Game/Shop/BaitShop/BaitShop.tscn")



