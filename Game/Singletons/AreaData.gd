extends Node


#Includes 
#---all areas in game
#---unlocked areas by player
onready var AvailableAreas = {
	"ThePond":					preload("res://Game/Areas/ThePond/ThePond.tscn"),
	"TheCamp":					preload("res://Game/Areas/TheCamp/TheCamp.tscn"),
	"TheLake":					preload("res://Game/Areas/TheLake/TheLake.tscn")
}

onready var UnlockedAreas = {
	"ThePond":					true,
	"TheCamp":					false,
	"TheLake":					false
}

onready var FishingAreas = {
	#Undiscovered -> Ventured -> Traversed -> Explored
	"ThePond":	{
		"Path":			preload("res://Game/Fishing/FishingAreas/FishingAtThePond/FishingAtThePond.tscn"),
		"AreaLevel":	1,
		"AreaExperience":	"Undiscovered",
		"AreaExperiencePts":	0
		},
	
	"TheLake":	{
		"Path":			preload("res://Game/Fishing/FishingAreas/FishingAtTheLake/FishingAtTheLake.tscn"),
		"AreaLevel":	2,
		"AreaExperience":	"Undiscovered",
		"AreaExperiencePts":	0
	}	
}

var just_leveled_up_area_experience = false

func add_area_experience_pts(added_pts, area_name):
	FishingAreas[area_name]["AreaExperiencePts"] += added_pts
	if FishingAreas[area_name]["AreaExperiencePts"] >= 100:
		just_leveled_up_area_experience = true
		FishingAreas[area_name]["AreaExperiencePts"] -= 100
		match return_area_experience(area_name):
			"Undiscovered":
				FishingAreas[area_name]["AreaExperience"] = "Ventured"
			"Ventured":
				FishingAreas[area_name]["AreaExperience"] = "Explored"
				FishingAreas[area_name]["AreaExperiencePts"] = 100
		

func return_fishing_area_level(area_name):
	return FishingAreas[area_name]["AreaLevel"]

func return_area_experience(area_name):
	return FishingAreas[area_name]["AreaExperience"]

onready var FishingAreasLvlUpNotifications = {
	"ThePond":	{
		"Ventured":		"Your increased familarity with \nthe area allows you to [color=aqua]catch 2\nmore Uncommon fish.",
		"Explored":		"Your increased expertise in the\narea allows you to [color=yellow]catch 1\nmore Rare fish."
		},
	
	"TheLake":	{
		"Ventured":		"Your increased familarity with \nthe area allows you to [color=aqua]catch 2\nmore Uncommon fish.",
		"Explored":		"Your increased expertise in the\narea allows you to [color=yellow]catch 1\nmore Rare fish."
		},
}


onready var BountyAreas = {
	"ThePond":		preload("res://Game/Bounties/BountiesAtThePond/BountiesAtThePond.tscn"),
	"TheLake":		preload("res://Game/Bounties/BountiesAtTheLake/BountiesAtTheLake.tscn")
}



onready var TreasureRewards = {
	"ThePond":		300,
	"TheLake":		600,
	"TheRiver":		900
}

func unlock_area(newly_unlocked_area):
	UnlockedAreas[newly_unlocked_area] = true

func travel_to_area(area_you_wish_to_travel):
	get_tree().change_scene(AvailableAreas[area_you_wish_to_travel])
