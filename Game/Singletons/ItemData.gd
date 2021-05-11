extends Node

onready var treasure_chest_resource = preload("res://Game/Treasure/TreasureChest/TreasureChest.tscn")

#contains infomation of every item in game
var ItemValue = {
	"Bait":					50,

	#first 4
	"BiggerNet":			1000,
	"FishCharmer":			1000,
	"KuehLapis":			1000,
	"TreasureMagnet":		1000,
	
	#second 4
	"HeadStart":			1000,
	"ShorterFinishLine":	1000,
	"Connoisseur":			1000,
	"TreasureHunter":		1000,
	
	#last 4
	"HotShot":				1000,
	"UnscathedBait":		1000,
	"SecondChance":			1000,
	"FishMonger":			1000,
	
	"TrainingRod":			1000,
	"WoodenRod":			1000
}

var UnlockedRodBlueprint = {
	"TrainingRod":		false,
	"WoodenRod":		false
}

func unlock_rod_blueprint(rod_name):
	UnlockedRodBlueprint[rod_name] = true

func check_if_rod_blueprint_is_unlocked(rod_name):
	return UnlockedRodBlueprint[rod_name]
	
var UnlockedRods = {
	"TrainingRod":		false,
	"WoodenRod":		false
}

func unlock_rod(rod_name):
	UnlockedRods[rod_name] = true

func check_if_rod_is_unlocked(rod_name):
	return UnlockedRods[rod_name]

var UnlockedPerkBlueprint = {
	"BiggerNet":				false,
	"FishCharmer":				false,
	"KuehLapis":				false,
	"TreasureMagnet":			false,
	
	"HeadStart":				false,
	"ShorterFinishLine":		false,
	"Connoisseur":				false,
	"TreasureHunter":			false,
	
	"HotShot":					false,
	"UnscathedBait":			false,
	"SecondChance":				false,
	"FishMonger":				false,
}

func unlock_perk_blueprint(perk_name):
	UnlockedPerkBlueprint[perk_name] = true

func check_if_perk_blueprint_is_unlocked(perk_name):
	return UnlockedPerkBlueprint[perk_name]
	
var Rods = {
	"BabyRod":		preload("res://Game/Fishing/Rods/BabyRod/BabyRod.tscn"),
	"TrainingRod":	preload("res://Game/Fishing/Rods/TrainingRod/TrainingRod.tscn"),
	"WoodenRod":	preload("res://Game/Fishing/Rods/WoodenRod/WoodenRod.tscn")
}

var RodData = {
	"BabyRod":	{
		"AreaLevelAllowed":		1,
		"PerkSlots":			1
	},
	
	"TrainingRod":	{
		"AreaLevelAllowed":		2,
		"PerkSlots":			2
	},
	
	"WoodenRod":	{
		"AreaLevelAllowed":		3,
		"PerkSlots":			3
	}
}


var BaitDescription = {
	"No bait":				"Fish will bite even if there's no bait.",
	"Bait":					"Fish will take reduced time to bite."
}

var RodDescription = {
	#need to list impt game info like 
		#number of perk slots
		#area level allowed
	"BabyRod":		"Small steps.\nPerk Slots: 1\nArea lvl allowed up to: 1",
	"TrainingRod":	"Rocky would be proud.\nPerk Slots: 2\nArea lvl allowed up to: 2",
	"WoodenRod":	"This could easily be mistaken as\na tree branch.\nPerk Slots: 3\nArea lvl allowed up to: 3"
	
}
