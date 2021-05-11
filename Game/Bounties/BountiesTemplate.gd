extends Control


func _on_GoBackToMenuButton_pressed():
	get_tree().change_scene_to(PlayerData.return_current_area_path())



