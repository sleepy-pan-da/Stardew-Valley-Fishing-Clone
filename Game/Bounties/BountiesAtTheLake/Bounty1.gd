extends Panel

#things to edit
onready var you_give_qty_of_anchovy = $VBoxContainer/FishProgressAnchovy/YouGave
onready var you_give_qty_of_sardine = $VBoxContainer/FishProgressSardine/YouGave
onready var you_give_qty_of_tuna = $VBoxContainer/FishProgressTuna/YouGave

onready var you_have_how_many_anchovy = $VBoxContainer/FishProgressAnchovy/YouHave
onready var you_have_how_many_sardine = $VBoxContainer/FishProgressSardine/YouHave
onready var you_have_how_many_tuna = $VBoxContainer/FishProgressTuna/YouHave

onready var you_have_how_many_anchovy_quality = $VBoxContainer/FishProgressAnchovy/YouHaveQuality
onready var you_have_how_many_sardine_quality = $VBoxContainer/FishProgressSardine/YouHaveQuality
onready var you_have_how_many_tuna_quality = $VBoxContainer/FishProgressTuna/YouHaveQuality

onready var give_anchovy_button = $VBoxContainer/FishProgressAnchovy/GiveAnchovy
onready var give_quality_anchovy_button = $VBoxContainer/FishProgressAnchovy/GiveQualityAnchovy
onready var give_sardine_button = $VBoxContainer/FishProgressSardine/GiveSardine
onready var give_quality_sardine_button = $VBoxContainer/FishProgressSardine/GiveQualitySardine
onready var give_tuna_button = $VBoxContainer/FishProgressTuna/GiveTuna
onready var give_quality_tuna_button = $VBoxContainer/FishProgressTuna/GiveQualityTuna
#-----------------------------------

onready var bounty_status = $VBoxContainer/Status

#things to edit
var bounty_number = "Bounty1"
#-----------------------------------

func _ready():
	remember_how_many_fish_you_gave()
	initialise_all_you_have_how_many_fish_text()
	if BountyData.check_if_completed_bounty(bounty_number):
		disable_all_buttons()
		bounty_status.text = "  Status: Completed!"

func remember_how_many_fish_you_gave():
	update_all_qty_given()

#things to edit
func initialise_all_you_have_how_many_fish_text():
	update_you_have_how_many_fish_text("anchovy")
	update_you_have_how_many_fish_text("qualityanchovy")
	update_you_have_how_many_fish_text("sardine")
	update_you_have_how_many_fish_text("qualitysardine")
	update_you_have_how_many_fish_text("tuna")
	update_you_have_how_many_fish_text("qualitytuna")


func update_you_have_how_many_fish_text(fishname):
	match fishname:
		"anchovy":
			you_have_how_many_anchovy.text = "  You Have " + str(PlayerData.return_number_of_fish("anchovy")) + " anchovy"
		"qualityanchovy":
			you_have_how_many_anchovy_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualityanchovy")) + " quality"
		"sardine":
			you_have_how_many_sardine.text = "  You Have " + str(PlayerData.return_number_of_fish("sardine")) + " sardine"
		"qualitysardine":
			you_have_how_many_sardine_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitysardine")) + " quality"
		"tuna":
			you_have_how_many_tuna.text = "  You Have " + str(PlayerData.return_number_of_fish("tuna")) + " tuna"
		"qualitytuna":
			you_have_how_many_tuna_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitytuna")) + " quality"

		
func _on_GiveAnchovy_pressed():
	var fish_name = "anchovy"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityAnchovy_pressed():
	var fish_name = "qualityanchovy"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveSardine_pressed():
	var fish_name = "sardine"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualitySardine_pressed():
	var fish_name = "qualitysardine"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveTuna_pressed():
	var fish_name = "tuna"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityTuna_pressed():
	var fish_name = "qualitysardine"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)
#-----------------------------------


func bounty_behaves_based_on_whether_you_have_fish(fish_name):
	if PlayerData.has_fish(fish_name):
		BackgroundMusic.play_give_fish_sound()
		PlayerData.remove_fish(fish_name)
		update_you_have_how_many_fish_text(fish_name)
		if "quality" in fish_name:
			fish_name = fish_name.replace("quality", "")
			BountyData.give_quality_fish_to_bounty(bounty_number, fish_name)
		else:
			BountyData.give_fish_to_bounty(bounty_number, fish_name)
		update_qty_given(fish_name)
		if BountyData.check_if_given_qty_met_requirement(bounty_number, fish_name):
			BountyData.update_bounty_progress(bounty_number)
			if BountyData.check_if_completed_bounty(bounty_number):
				disable_all_buttons()
				bounty_status.text = "  Status: Completed!"
				give_reward()
	else:
		print("you no fish")

#things to edit
func update_qty_given(fish_name):
	match fish_name:
		"anchovy", "qualityanchovy":
			you_give_qty_of_anchovy.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "anchovy")
		"sardine", "qualitysardine":
			you_give_qty_of_sardine.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "sardine")
		"tuna", "qualitytuna":
			you_give_qty_of_tuna.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "tuna")

func update_all_qty_given():
	you_give_qty_of_anchovy.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "anchovy")
	you_give_qty_of_sardine.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "sardine")
	you_give_qty_of_tuna.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "tuna")
	
func give_reward():
	print("give reward!")
	ItemData.unlock_perk_blueprint("HeadStart")
	ItemData.unlock_perk_blueprint("ShorterFinishLine")
	ItemData.unlock_perk_blueprint("Connoisseur")
	ItemData.unlock_perk_blueprint("TreasureHunter")

func disable_all_buttons():
	give_anchovy_button.disabled = true
	give_quality_anchovy_button.disabled = true
	give_sardine_button.disabled = true
	give_quality_sardine_button.disabled = true
	give_tuna_button.disabled = true
	give_quality_tuna_button.disabled = true
#-----------------------------------








