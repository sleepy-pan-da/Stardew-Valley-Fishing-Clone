extends "res://Game/MarketPlace/MarketPlaceTemplate.gd"






func _on_GeneralVendor_pressed():
	get_tree().change_scene_to(AreaData.Shops["StartingArea"])
