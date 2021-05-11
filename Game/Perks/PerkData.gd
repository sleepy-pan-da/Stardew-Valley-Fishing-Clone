extends Node


onready var UnlockedPerks = {
	
	#first 4
	"BiggerNet":				false,
	"FishCharmer":				false,
	"KuehLapis":				false,
	"TreasureMagnet":			false,
	
	#second 4
	"HeadStart":				false,
	"ShorterFinishLine":		false,
	"Connoisseur":				false,
	"TreasureHunter":			false,
	
	#last 4
	"HotShot":					false,
	"UnscathedBait":			false,
	"SecondChance":				false,
	"FishMonger":				false,
}

onready var AllPerkButtons = {
	"BiggerNet":				preload("res://Game/Perks/BiggerNet/BiggerNet.tscn"),
	"TreasureMagnet":			preload("res://Game/Perks/TreasureMagnet/TreasureMagnet.tscn"),
	"HotShot":					preload("res://Game/Perks/HotShot/HotShot.tscn"),
	"FishCharmer":				preload("res://Game/Perks/FishCharmer/FishCharmer.tscn"),
	"HeadStart":				preload("res://Game/Perks/HeadStart/HeadStart.tscn"),
	"TreasureHunter":			preload("res://Game/Perks/TreasureHunter/TreasureHunter.tscn"),
	"ShorterFinishLine":		preload("res://Game/Perks/ShorterFinishLine/ShorterFinishLine.tscn"),
	"UnscathedBait":			preload("res://Game/Perks/UnscathedBait/UnscathedBait.tscn"),
	"SecondChance":				preload("res://Game/Perks/SecondChance/SecondChance.tscn"),
	"FishMonger":				preload("res://Game/Perks/FishMonger/FishMonger.tscn"),
	"Connoisseur":				preload("res://Game/Perks/Connoisseur/Connoisseur.tscn"),
	"KuehLapis":				preload("res://Game/Perks/KuehLapis/KuehLapis.tscn"),
}

onready var PerkDescriptions = {
	"BiggerNet":		"Increase fishing bar area by 1.25x.\nConsumes 1 slot",
	"TreasureMagnet":	"Treasures appear more often.\n20%->40%\nConsumes 1 slot",
	"HotShot":			"Progress bar fills and drops\ntwice as fast.\nConsumes 1 slot",
	"FishCharmer":		"Waiting time for fish to bite\nis reduced.\nConsumes 1 slot",
	"HeadStart":		"Progress bar is partially filled\ninitially.\nConsumes 1 slot",
	"TreasureHunter":	"Treasures are worth 1.5x more.\nConsumes 1 slot",
	"ShorterFinishLine":"Value needed to fill progress bar\nis lesser.\nConsumes 1 slot",
	"UnscathedBait":	"Bait have a 50% chance to not\nbe consumed when fishing.\nConsumes 1 slot",
	"SecondChance":		"You can afford one more chance\nfor a perfect catch.\nConsumes 2 slot",
	"FishMonger":		"Fishes are worth 1.25x more.\nConsumes 1 slot",
	"Connoisseur":		"Quality fishes worth 1.25x more\nnon quality fishes worth 0.75x.\nConsumes 1 slot",
	"KuehLapis":		"Fish is worth 25g more with each\nsuccessive catch.(Stacks 9 times)\nConsumes 1 slot"
}

onready var PerkConsumption = {
	"BiggerNet":		1,
	"TreasureMagnet":	1,
	"HotShot":			1,
	"FishCharmer":		1,
	"HeadStart":		1,
	"TreasureHunter":	1,
	"ShorterFinishLine":1,
	"UnscathedBait":	1,
	"SecondChance":		2,
	"FishMonger":		1,
	"Connoisseur":		1,
	"KuehLapis":		1
}

func unlock_perk(newly_unlocked_perk):
	UnlockedPerks[newly_unlocked_perk] = true

func check_if_perk_is_unlocked(perk_name):
	return UnlockedPerks[perk_name]
