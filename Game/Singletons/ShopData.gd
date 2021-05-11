extends Node

#items that are sold in the Bait Shop
onready var BaitShop = {
	"Bait":						preload("res://Game/Items/Baits/Bait/Bait.tscn")	
}

onready var RodSmith = { #contains all rods
	"TrainingRod":			preload("res://Game/Items/UnlockedRods/TrainingRod/TrainingRod.tscn"),
	"WoodenRod":			preload("res://Game/Items/UnlockedRods/WoodenRod/WoodenRod.tscn")
}

onready var Cartographer = {
	"TheLake":				preload("res://Game/Items/MapTemplate/TheLake/TheLake.tscn")
}

onready var Trainer = { #contains all perks
	"BiggerNet":			preload("res://Game/Items/UnlockedPerks/BiggerNet/BiggerNet.tscn"),
	"FishCharmer":			preload("res://Game/Items/UnlockedPerks/FishCharmer/FishCharmer.tscn"),
	"KuehLapis":			preload("res://Game/Items/UnlockedPerks/KuehLapis/KuehLapis.tscn"),
	"TreasureMagnet":		preload("res://Game/Items/UnlockedPerks/TreasureMagnet/TreasureMagnet.tscn"),
	
	"HeadStart":			preload("res://Game/Items/UnlockedPerks/HeadStart/HeadStart.tscn"),
	"ShorterFinishLine":	preload("res://Game/Items/UnlockedPerks/ShorterFinishLine/ShorterFinishLine.tscn"),
	"Connoisseur":			preload("res://Game/Items/UnlockedPerks/Connoisseur/Connoisseur.tscn"),
	"TreasureHunter":		preload("res://Game/Items/UnlockedPerks/TreasureHunter/TreasureHunter.tscn"),
	
	"HotShot":				preload("res://Game/Items/UnlockedPerks/HotShot/HotShot.tscn"),
	"UnscathedBait":		preload("res://Game/Items/UnlockedPerks/UnscathedBait/UnscathedBait.tscn"),
	"SecondChance":			preload("res://Game/Items/UnlockedPerks/SecondChance/SecondChance.tscn"),
	"FishMonger":			preload("res://Game/Items/UnlockedPerks/FishMonger/FishMonger.tscn")
	
}
