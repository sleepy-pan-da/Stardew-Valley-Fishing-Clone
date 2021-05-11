extends "res://Game/Camp/CampShopTemplate.gd"


func _on_BuyPerksButton_pressed():
	get_tree().change_scene("res://Game/Shop/Trainer/Trainer.tscn")


func _on_LockedPerksButton_pressed():
	get_tree().change_scene("res://Game/Shop/Trainer/LockedPerks.tscn")
