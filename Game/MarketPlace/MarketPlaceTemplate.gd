extends Control



func _on_SellFish_pressed():
	get_tree().change_scene("res://Game/Selling/Selling.tscn")

func _on_GoBackToMenuButton_pressed():
	get_tree().change_scene_to(PlayerData.return_current_area_path())
