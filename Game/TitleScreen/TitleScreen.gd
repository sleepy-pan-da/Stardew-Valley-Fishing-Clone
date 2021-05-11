extends Control


var save_path = "user://save.dat"

func _on_NewGameButton_pressed():
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		var data
		file.store_var(data)
		file.close()
		print("New game")
	get_tree().change_scene_to(AreaData.AvailableAreas["ThePond"])

func _on_ResumeButton_pressed():
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open(save_path, File.READ)
		if error == OK:
			var data = file.get_var()
			if data == null:
				file.close()
				print("New game")
				get_tree().change_scene_to(AreaData.AvailableAreas["ThePond"])
			else:
				load_player_data(data)
				load_item_data(data)
				load_area_data(data)
				load_bounty_data(data)
				load_perk_data(data)
				file.close()
				print("Resumed game successfully")
				get_tree().change_scene_to(AreaData.AvailableAreas["ThePond"])

func load_player_data(data):
	PlayerData.gold_amount = data["player_data"]["gold_amount"]
	PlayerData.equipped_rod = data["player_data"]["equipped_rod"]
	PlayerData.equipped_bait = data["player_data"]["equipped_bait"]
	PlayerData.occupied_slots = data["player_data"]["occupied_slots"]
	PlayerData.equipped_perks = data["player_data"]["equipped_perks"]
	PlayerData.fish_caught = data["player_data"]["fish_caught"]
	PlayerData.fish_cost = data["player_data"]["fish_cost"]
	PlayerData.inventory = data["player_data"]["inventory"]

func load_item_data(data):
	ItemData.UnlockedRodBlueprint = data["item_data"]["unlocked_rod_blueprint"]
	ItemData.UnlockedRods = data["item_data"]["unlocked_rods"]
	ItemData.UnlockedPerkBlueprint = data["item_data"]["unlocked_perk_blueprint"]

func load_area_data(data):
	AreaData.UnlockedAreas = data["area_data"]["unlocked_areas"]
	AreaData.FishingAreas["ThePond"]["AreaExperience"] = data["area_data"]["pond_experience"]
	AreaData.FishingAreas["ThePond"]["AreaExperiencePts"] = data["area_data"]["pond_experience_pts"]
	AreaData.FishingAreas["TheLake"]["AreaExperience"] = data["area_data"]["lake_experience"]
	AreaData.FishingAreas["TheLake"]["AreaExperiencePts"] = data["area_data"]["lake_experience_pts"]
func load_bounty_data(data):
	BountyData.BountyProgress = data["bounty_data"]["bounty_progress"]

func load_perk_data(data):
	PerkData.UnlockedPerks = data["perk_data"]["unlocked_perks"]





