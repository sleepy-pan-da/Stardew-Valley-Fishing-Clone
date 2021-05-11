extends Node

#important infomation that pertains to player
#for easy testing purpose ----> ["steady", "floater", "sinker"]
var gold_amount = 0
var current_area = ""
var came_from_camp = false
var current_fishing_area = ""
var default_rod = "BabyRod"
var default_bait = "No bait"
var equipped_rod = default_rod
var equipped_bait = default_bait
var occupied_slots = 0
var equipped_perks = []
var kueh_lapis_streak = 0
var opened_chest = false
var mobile_mode = false
#["qualitysteady", "qualitysteady2", "qualitysteady3",
#					"qualitysinker", "qualitysinker2", "qualitysinker3",
#					"qualityfloater", "qualityfloater2", "qualityfloater3"]
var fish_caught = []
var fish_cost = []
#[100, 100, 100, 100, 100, 100, 100, 100, 100]

var inventory ={
	"baits":	{
		#"Bait":			0
	}
	
	#rods will not included in inventory as you can only have 1 specific rod
#	"rods":		{
#
#	}
}

func add_fish(fish):
	fish_caught.append(fish)
	var fish_value = FishData.FishValue[fish]
	if PlayerData.has_perk("FishMonger"):
		print("Fishmonger is taking effect")
		fish_value *= 1.25
	if PlayerData.has_perk("Connoisseur"):
		print("Connoisseur is taking effect")
		if "quality" in fish:
			fish_value *= 1.25
			print("Quality indeed!")
		else:
			fish_value *= 0.75
			print("I have no time for lousy fish!")
	if PlayerData.has_perk("KuehLapis"):
		print("KuehLapis is taking effect")
		if kueh_lapis_streak < 9:
			kueh_lapis_streak += 1
		fish_value += kueh_lapis_streak * 25
	else:
		kueh_lapis_streak = 0
	fish_cost.append(round(fish_value))
	print(fish_caught)
	print(fish_cost)

func remove_fish(fish):
	var index_of_fish = fish_caught.find(fish, 0)
	fish_caught.remove(index_of_fish)
	fish_cost.remove(index_of_fish)
	print(fish_caught)
	print(fish_cost)
	
func update_gold_amount(change_in_gold):
	gold_amount += change_in_gold

func has_fish(fish):
	if fish_caught.find(fish, 0) != -1:
		return true
	else:
		return false

func return_number_of_fish(fish):
	return fish_caught.count(fish)

func return_current_area_path():
	return AreaData.AvailableAreas[current_area]
	
func return_current_fishing_area_path():
	return AreaData.FishingAreas[current_fishing_area]["Path"]

func return_current_fishing_area_level():
	return AreaData.FishingAreas[current_fishing_area]["AreaLevel"]
	
func return_equipped_rod_level():
	return ItemData.RodData[equipped_rod]["AreaLevelAllowed"]


func add_to_inventory(inventory_category, item_name):
	if !inventory[inventory_category].has(item_name):
		inventory[inventory_category][item_name] = 1
	else:
		inventory[inventory_category][item_name] += 1
	print(inventory)

func add_to_bait_inventory(bait_name):
	if !inventory["baits"][current_area].has(bait_name):
		inventory["baits"][current_area][bait_name] = 1
	else:
		inventory["baits"][current_area][bait_name] += 1
	print(inventory)

func subtract_bait_from_inventory(bait_name):
	inventory["baits"][bait_name] -= 1
	if inventory["baits"][bait_name] <= 0:
		inventory["baits"].erase(bait_name)
		
func equip_rod(selected_rod):
	equipped_rod = selected_rod
	occupied_slots = 0
	equipped_perks.clear()
	print("equipped " + selected_rod)
	
func equip_bait(selected_bait):
	equipped_bait = selected_bait
	print("equipped " + selected_bait)

func update_equipped_bait_when_run_out():
	if !inventory["baits"].has(equipped_bait):
		equipped_bait = "No bait"

func get_qty_of_bait(bait_name):
	if !inventory["baits"].has(bait_name):
		return 0
	return inventory["baits"][bait_name]

func get_qty_of_equipped_bait():
	return inventory["baits"][equipped_bait]

func return_equipped_rod_perk_slots():
	return ItemData.RodData[equipped_rod]["PerkSlots"]

func equip_perk(perk_name):
	equipped_perks.append(perk_name)

func unequip_perk(perk_name):
	var index_of_perk = equipped_perks.find(perk_name, 0)
	equipped_perks.remove(index_of_perk)

func has_perk(perk_name):
	if equipped_perks.find(perk_name, 0) != -1:
		return true
	else:
		return false
