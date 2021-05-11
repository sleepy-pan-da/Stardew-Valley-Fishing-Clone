extends Control



func _on_GoBackToMenuButton_pressed():
	get_tree().change_scene_to(PlayerData.return_current_fishing_area_path())

func _on_TryEquippedRod_pressed():
	get_tree().change_scene("res://Game/Loadout/TryRod/TryRod.tscn")

func _on_EquipPerks_pressed():
	get_tree().change_scene("res://Game/Perks/Perks.tscn")
