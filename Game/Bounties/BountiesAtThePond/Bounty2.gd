extends Panel

#things to edit
onready var you_give_qty_of_biggergoldfish = $VBoxContainer/FishProgressBiggerGoldfish/YouGave
onready var you_give_qty_of_biggerguppy = $VBoxContainer/FishProgressBiggerGuppy/YouGave

onready var you_have_how_many_biggergoldfish = $VBoxContainer/FishProgressBiggerGoldfish/YouHave
onready var you_have_how_many_biggerguppy = $VBoxContainer/FishProgressBiggerGuppy/YouHave

onready var you_have_how_many_biggergoldfish_quality = $VBoxContainer/FishProgressBiggerGoldfish/YouHaveQuality
onready var you_have_how_many_biggerguppy_quality = $VBoxContainer/FishProgressBiggerGuppy/YouHaveQuality


onready var give_biggergoldfish_button = $VBoxContainer/FishProgressBiggerGoldfish/GiveBiggerGoldfish
onready var give_quality_biggergoldfish_button = $VBoxContainer/FishProgressBiggerGoldfish/GiveQualityBiggerGoldfish
onready var give_biggerguppy_button = $VBoxContainer/FishProgressBiggerGuppy/GiveBiggerGuppy
onready var give_quality_biggerguppy_button = $VBoxContainer/FishProgressBiggerGuppy/GiveQualityBiggerGuppy
#-----------------------------------

onready var bounty_status = $VBoxContainer/Status

#things to edit
var bounty_number = "Bounty2"
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
	update_you_have_how_many_fish_text("biggergoldfish")
	update_you_have_how_many_fish_text("qualitybiggergoldfish")
	update_you_have_how_many_fish_text("biggerguppy")
	update_you_have_how_many_fish_text("qualitybiggerguppy")


func update_you_have_how_many_fish_text(fishname):
	match fishname:
		"biggergoldfish":
			you_have_how_many_biggergoldfish.text = "  You Have " + str(PlayerData.return_number_of_fish("biggergoldfish")) + " biggergoldfish"
		"qualitybiggergoldfish":
			you_have_how_many_biggergoldfish_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitybiggergoldfish")) + " quality"
		"biggerguppy":
			you_have_how_many_biggerguppy.text = "  You Have " + str(PlayerData.return_number_of_fish("biggerguppy")) + " biggerguppy"
		"qualitybiggerguppy":
			you_have_how_many_biggerguppy_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitybiggerguppy")) + " quality"
	
func _on_GiveBiggerGoldfish_pressed():
	var fish_name = "biggergoldfish"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityBiggerGoldfish_pressed():
	var fish_name = "qualitybiggergoldfish"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveBiggerGuppy_pressed():
	var fish_name = "biggerguppy"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityBiggerGuppy_pressed():
	var fish_name = "qualitybiggerguppy"
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
		"biggergoldfish", "qualitybiggergoldfish":
			you_give_qty_of_biggergoldfish.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "biggergoldfish")
		"biggerguppy", "qualitybiggerguppy":
			you_give_qty_of_biggerguppy.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "biggerguppy")

func update_all_qty_given():
	you_give_qty_of_biggergoldfish.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "biggergoldfish")
	you_give_qty_of_biggerguppy.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "biggerguppy")
	
func give_reward():
	print("give reward!")
	ItemData.unlock_perk_blueprint("BiggerNet")
	ItemData.unlock_perk_blueprint("FishCharmer")
	ItemData.unlock_perk_blueprint("KuehLapis")
	ItemData.unlock_perk_blueprint("TreasureMagnet")
	
func disable_all_buttons():
	give_biggergoldfish_button.disabled = true
	give_quality_biggergoldfish_button.disabled = true
	give_biggerguppy_button.disabled = true
	give_quality_biggerguppy_button.disabled = true
#-----------------------------------








