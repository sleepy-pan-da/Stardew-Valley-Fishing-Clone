extends Panel

#things to edit
onready var you_give_qty_of_cod = $VBoxContainer/FishProgressCod/YouGave
onready var you_give_qty_of_pike = $VBoxContainer/FishProgressPike/YouGave

onready var you_have_how_many_cod = $VBoxContainer/FishProgressCod/YouHave
onready var you_have_how_many_pike = $VBoxContainer/FishProgressPike/YouHave

onready var you_have_how_many_cod_quality = $VBoxContainer/FishProgressCod/YouHaveQuality
onready var you_have_how_many_pike_quality = $VBoxContainer/FishProgressPike/YouHaveQuality


onready var give_cod_button = $VBoxContainer/FishProgressCod/GiveCod
onready var give_quality_cod_button = $VBoxContainer/FishProgressCod/GiveQualityCod
onready var give_pike_button = $VBoxContainer/FishProgressPike/GivePike
onready var give_quality_pike_button = $VBoxContainer/FishProgressPike/GiveQualityPike
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
	update_you_have_how_many_fish_text("cod")
	update_you_have_how_many_fish_text("qualitycod")
	update_you_have_how_many_fish_text("pike")
	update_you_have_how_many_fish_text("qualitypike")


func update_you_have_how_many_fish_text(fishname):
	match fishname:
		"cod":
			you_have_how_many_cod.text = "  You Have " + str(PlayerData.return_number_of_fish("cod")) + " cod"
		"qualitycod":
			you_have_how_many_cod_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitycod")) + " quality"
		"pike":
			you_have_how_many_pike.text = "  You Have " + str(PlayerData.return_number_of_fish("pike")) + " pike"
		"qualitypike":
			you_have_how_many_pike_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitypike")) + " quality"

func _on_GiveCod_pressed():
	var fish_name = "cod"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityCod_pressed():
	var fish_name = "qualitycod"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GivePike_pressed():
	var fish_name = "pike"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityPike_pressed():
	var fish_name = "qualitypike"
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
		"cod", "qualitycod":
			you_give_qty_of_cod.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "cod")
		"pike", "qualitypike":
			you_give_qty_of_pike.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "pike")

func update_all_qty_given():
	you_give_qty_of_cod.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "cod")
	you_give_qty_of_pike.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "pike")
	
func give_reward():
	print("give reward!")
	ItemData.unlock_perk_blueprint("HotShot")
	ItemData.unlock_perk_blueprint("UnscathedBait")
	ItemData.unlock_perk_blueprint("SecondChance")
	ItemData.unlock_perk_blueprint("FishMonger")
	
func disable_all_buttons():
	give_cod_button.disabled = true
	give_quality_cod_button.disabled = true
	give_pike_button.disabled = true
	give_quality_pike_button.disabled = true
#-----------------------------------











