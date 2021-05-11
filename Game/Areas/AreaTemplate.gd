extends Control

var save_path = "user://save.dat"

func update_player_current_area(area_name):
	PlayerData.current_area = area_name

func _on_TravelButton_pressed():
	get_tree().change_scene("res://Game/Travel/Travel.tscn")


func _on_SaveButton_pressed():
	var data = {
		"player_data": {
			"gold_amount":		PlayerData.gold_amount,
			"equipped_rod":		PlayerData.equipped_rod,
			"equipped_bait":	PlayerData.equipped_bait,
			"occupied_slots":	PlayerData.occupied_slots,
			"equipped_perks":	PlayerData.equipped_perks,
			"fish_caught":		PlayerData.fish_caught,
			"fish_cost":		PlayerData.fish_cost,
			"inventory":		PlayerData.inventory
		},
		"item_data":	{
			"unlocked_rod_blueprint":	ItemData.UnlockedRodBlueprint,
			"unlocked_rods":			ItemData.UnlockedRods,
			"unlocked_perk_blueprint":	ItemData.UnlockedPerkBlueprint
		},
		"area_data":	{
			"unlocked_areas":			AreaData.UnlockedAreas,
			"pond_experience":			AreaData.FishingAreas["ThePond"]["AreaExperience"],
			"pond_experience_pts":		AreaData.FishingAreas["ThePond"]["AreaExperiencePts"],
			"lake_experience":			AreaData.FishingAreas["TheLake"]["AreaExperience"],
			"lake_experience_pts":		AreaData.FishingAreas["TheLake"]["AreaExperiencePts"]
		},
		"bounty_data":	{
			"bounty_progress":			BountyData.BountyProgress
		},
		"perk_data":	{
			"unlocked_perks":			PerkData.UnlockedPerks
		}
	}
	
	var file = File.new()
	var error = file.open(save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()
		print("saved successfully")
	else:
		print("error in saving")
	
