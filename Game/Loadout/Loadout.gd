extends Control



func _on_GoBackToMenuButton_pressed():
	get_tree().change_scene_to(PlayerData.return_current_area_path())

func _on_TryEquippedRod_pressed():
	get_tree().change_scene("res://Game/Loadout/TryRod/TryRod.tscn")

func _on_EquipPerks_pressed():
	if PlayerData.current_area == "TheCamp":
		PlayerData.came_from_camp = true
	get_tree().change_scene("res://Game/Perks/Perks.tscn")
