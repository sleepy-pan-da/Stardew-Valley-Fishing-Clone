extends Node

#important infomation that pertains to fish like
#---behaviour when catching
#---monetary value
#---fish button when selling
#---fish reward page when you caught the fish

#come up with 6 simple fish (2 steady, 2 sinkers, 2 floaters)
#fish that are done
#set of 3
#anchovy
#tuna
#sardine

var fishes_at_area = []

func check_if_fishes_at_area_is_empty():
	return fishes_at_area.empty()

func populate_fishes_at_area(area_name, experience_lvl):
	fishes_at_area = FishAt[area_name][experience_lvl].keys()
	print("populating fishes at area")
	print(fishes_at_area)

func generate_index_from_fishes_at_area():
	return randi() % fishes_at_area.size()

func generate_fish_from_fishes_at_area(index):
	var fish_name = fishes_at_area[index]
	fishes_at_area.remove(index)
	var current_area_experience = AreaData.return_area_experience(PlayerData.current_fishing_area)
	print("Generated Fish: " + fish_name)
	print(fishes_at_area)
	return FishAt[PlayerData.current_fishing_area][current_area_experience][fish_name]

onready var FishAt = {
	"ThePond":		{
				"Undiscovered":	{
					"goldfish":				preload("res://Game/Fish/Goldfish/Goldfish.tscn"),
					"guppy":				preload("res://Game/Fish/Guppy/Guppy.tscn"),
					"flyingfish":			preload("res://Game/Fish/Flyingfish/Flyingfish.tscn")
				}, 
				
				"Ventured":	{
					"goldfish":				preload("res://Game/Fish/Goldfish/Goldfish.tscn"),
					"guppy":				preload("res://Game/Fish/Guppy/Guppy.tscn"),
					"flyingfish":			preload("res://Game/Fish/Flyingfish/Flyingfish.tscn"),
					"biggergoldfish":		preload("res://Game/Fish/BiggerGoldfish/BiggerGoldfish.tscn"),
					"biggerguppy":			preload("res://Game/Fish/BiggerGuppy/BiggerGuppy.tscn")
				}, 
				
				"Explored":	{
					"goldfish":				preload("res://Game/Fish/Goldfish/Goldfish.tscn"), #done
					"guppy":				preload("res://Game/Fish/Guppy/Guppy.tscn"), #done
					"flyingfish":			preload("res://Game/Fish/Flyingfish/Flyingfish.tscn"), #done
					"biggergoldfish":		preload("res://Game/Fish/BiggerGoldfish/BiggerGoldfish.tscn"),	#done
					"biggerguppy":			preload("res://Game/Fish/BiggerGuppy/BiggerGuppy.tscn"),	#done
					"koi":					preload("res://Game/Fish/Koi/Koi.tscn"),	#done
				}
	},
	
	"TheLake":		{
				"Undiscovered":	{
							"anchovy":		preload("res://Game/Fish/Anchovy/Anchovy.tscn"),
							"sardine":		preload("res://Game/Fish/Sardine/Sardine.tscn"),
							"tuna":			preload("res://Game/Fish/Tuna/Tuna.tscn")
						}, 
						
						"Ventured":	{
							"anchovy":		preload("res://Game/Fish/Anchovy/Anchovy.tscn"),
							"sardine":		preload("res://Game/Fish/Sardine/Sardine.tscn"),
							"tuna":			preload("res://Game/Fish/Tuna/Tuna.tscn"),
							"cod":			preload("res://Game/Fish/Cod/Cod.tscn"),
							"pike":			preload("res://Game/Fish/Pike/Pike.tscn")
						}, 
						
						"Explored":	{
							"anchovy":		preload("res://Game/Fish/Anchovy/Anchovy.tscn"),
							"sardine":		preload("res://Game/Fish/Sardine/Sardine.tscn"),
							"tuna":			preload("res://Game/Fish/Tuna/Tuna.tscn"),
							"cod":			preload("res://Game/Fish/Cod/Cod.tscn"),
							"pike":			preload("res://Game/Fish/Pike/Pike.tscn"),
							"herring":		preload("res://Game/Fish/Herring/Herring.tscn")
						}
	},
	
	"TheRiver":		{
				"Undiscovered":	{
							
						},
	},
}

var FishRarity = {
	#fish at the pond
	"goldfish":				"Common",
	"qualitygoldfish":		"Common",
	"guppy":				"Common",
	"qualityguppy":			"Common",
	"flyingfish":			"Common",
	"qualityflyingfish":	"Common",
	"biggergoldfish":			"Uncommon",
	"qualitybiggergoldfish":	"Uncommon",
	"biggerguppy":				"Uncommon",
	"qualitybiggerguppy":		"Uncommon",
	"koi":			"Rare",
	"qualitykoi":	"Rare",
	#fish at the lake
	"anchovy":				"Common",
	"qualityanchovy":		"Common",
	"sardine":				"Common",
	"qualitysardine":		"Common",
	"tuna":					"Common",
	"qualitytuna":			"Common",
	"cod":						"Uncommon",
	"qualitycod":				"Uncommon",
	"pike":						"Uncommon",
	"qualitypike":				"Uncommon",
	"herring":			"Rare",
	"qualityherring":	"Rare"
}

var FishExp = {
	#fish at the pond
	"goldfish":				5,
	"qualitygoldfish":		15,
	"guppy":				5,
	"qualityguppy":			15,
	"flyingfish":			5,
	"qualityflyingfish":	15,
	"biggergoldfish":			10,
	"qualitybiggergoldfish":	30,
	"biggerguppy":				10,
	"qualitybiggerguppy":		30,
	"koi":			0,
	"qualitykoi":	0,
	#fish at the lake
	"anchovy":				5,
	"qualityanchovy":		15,
	"sardine":				5,
	"qualitysardine":		15,
	"tuna":					5,
	"qualitytuna":			15,
	"cod":						10,
	"qualitycod":				30,
	"pike":						10,
	"qualitypike":				30,
	"herring":			0,
	"qualityherring":	0
	
}

var FishValue = {
	#quality is 3x of original value
	#fish at the pond
	"goldfish":				100,
	"qualitygoldfish":		300,
	"guppy":				105,
	"qualityguppy":			315,
	"flyingfish":			105,
	"qualityflyingfish":	315,
	
	"biggergoldfish":			120,
	"qualitybiggergoldfish":	360,
	"biggerguppy":				120,
	"qualitybiggerguppy":		360,
	
	"koi":			150,
	"qualitykoi":	450,
	#fish at the lake
	"anchovy":				120,
	"qualityanchovy":		360,
	"sardine":				120,
	"qualitysardine":		360,
	"tuna":					120,
	"qualitytuna":			360,
	"cod":						200,
	"qualitycod":				600,
	"pike":						200,
	"qualitypike":				600,
	"herring":			300,
	"qualityherring":	900
	
	
}

onready var FishButton = {
	#fish at the pond
	"goldfish":						preload("res://Game/Fish/Goldfish/GoldfishButton.tscn"),
	"qualitygoldfish":				preload("res://Game/Fish/Goldfish/QualityGoldfishButton.tscn"), #done
	"guppy":						preload("res://Game/Fish/Guppy/GuppyButton.tscn"),
	"qualityguppy":					preload("res://Game/Fish/Guppy/QualityGuppyButton.tscn"), #done
	"flyingfish":					preload("res://Game/Fish/Flyingfish/FlyingfishButton.tscn"),
	"qualityflyingfish":			preload("res://Game/Fish/Flyingfish/QualityFlyingfishButton.tscn"), #done
	"biggergoldfish":				preload("res://Game/Fish/BiggerGoldfish/BiggerGoldfishButton.tscn"),
	"qualitybiggergoldfish":		preload("res://Game/Fish/BiggerGoldfish/QualityBiggerGoldfishButton.tscn"), #done
	"biggerguppy":					preload("res://Game/Fish/BiggerGuppy/BiggerGuppyButton.tscn"),
	"qualitybiggerguppy":			preload("res://Game/Fish/BiggerGuppy/QualityBiggerGuppyButton.tscn"), #done	
	"koi":							preload("res://Game/Fish/Koi/KoiButton.tscn"),
	"qualitykoi":					preload("res://Game/Fish/Koi/QualityKoiButton.tscn"),	#done
	#fish at the lake
	"anchovy":						preload("res://Game/Fish/Anchovy/AnchovyButton.tscn"),
	"qualityanchovy":				preload("res://Game/Fish/Anchovy/QualityAnchovyButton.tscn"),
	"sardine":						preload("res://Game/Fish/Sardine/SardineButton.tscn"),
	"qualitysardine":				preload("res://Game/Fish/Sardine/QualitySardineButton.tscn"),
	"tuna":							preload("res://Game/Fish/Tuna/TunaButton.tscn"),
	"qualitytuna":					preload("res://Game/Fish/Tuna/QualityTunaButton.tscn"),
	"cod":							preload("res://Game/Fish/Cod/CodButton.tscn"),
	"qualitycod":					preload("res://Game/Fish/Cod/QualityCodButton.tscn"),
	"pike":							preload("res://Game/Fish/Pike/PikeButton.tscn"),
	"qualitypike":					preload("res://Game/Fish/Pike/QualityPikeButton.tscn"),
	"herring":						preload("res://Game/Fish/Herring/HerringButton.tscn"),
	"qualityherring":				preload("res://Game/Fish/Herring/QualityHerringButton.tscn")
	
	
}

var FishReward = "res://Game/Fish/FishTemplate/FishRewardTemplate.tscn"
	
