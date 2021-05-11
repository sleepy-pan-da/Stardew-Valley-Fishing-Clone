extends Control

onready var treasure = $Treasure
onready var fish_name = $FishName
onready var fish_loot = $FishLoot
onready var fish_rarity = $FishRarity

func _ready():
	update_fish_reward()
	if PlayerData.opened_chest:
		randomize()
		var median_gold_amount_in_area = AreaData.TreasureRewards[PlayerData.current_area]
		var gold_amount_in_chest = median_gold_amount_in_area
		if PlayerData.has_perk("TreasureHunter"):
			print("Treasure Hunter is in effect")
			gold_amount_in_chest *= 1.5
		treasure.text = str(gold_amount_in_chest) + " from\ntreasure"
		PlayerData.opened_chest = false
		PlayerData.update_gold_amount(gold_amount_in_chest)

func update_fish_reward():
	if PlayerData.fish_caught.size() > 0 and PlayerData.fish_cost.size() > 0:
		fish_name.text = PlayerData.fish_caught[-1]
		fish_loot.text = "It's worth " + str(PlayerData.fish_cost[-1]) + "g\nand " + str(FishData.FishExp[fish_name.text]) + "exp" 
		
		update_fish_rarity(fish_name.text )
		
func update_fish_rarity(fish_name):
	var rarity = FishData.FishRarity[fish_name]
	match rarity:
		"Common":
			fish_rarity.bbcode_text = "[center][color=silver]*Common*[/color][/center]"
		"Uncommon":
			fish_rarity.bbcode_text = "[center][color=aqua]*Uncommon*[/color][/center]"
		"Rare":
			fish_rarity.bbcode_text = "[center][color=yellow]*Rare*[/color][/center]"

func _on_Button_pressed():
	get_tree().change_scene_to(PlayerData.return_current_fishing_area_path())
