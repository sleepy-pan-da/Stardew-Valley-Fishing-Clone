extends Panel

#things to edit
onready var you_give_qty_of_koi = $VBoxContainer/FishProgressKoi/YouGave

onready var you_have_how_many_koi = $VBoxContainer/FishProgressKoi/YouHave

onready var you_have_how_many_koi_quality = $VBoxContainer/FishProgressKoi/YouHaveQuality

onready var give_koi_button = $VBoxContainer/FishProgressKoi/GiveKoi
onready var give_quality_koi_button = $VBoxContainer/FishProgressKoi/GiveQualityKoi
#-----------------------------------

onready var bounty_status = $VBoxContainer/Status

#things to edit
var bounty_number = "Bounty3"
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
	update_you_have_how_many_fish_text("koi")
	update_you_have_how_many_fish_text("qualitykoi")


func update_you_have_how_many_fish_text(fishname):
	match fishname:
		"koi":
			you_have_how_many_koi.text = "  You Have " + str(PlayerData.return_number_of_fish("koi")) + " koi"
		"qualitykoi":
			you_have_how_many_koi_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitykoi")) + " quality"
	
func _on_GiveKoi_pressed():
	var fish_name = "koi"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityKoi_pressed():
	var fish_name = "qualitykoi"
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
		"koi", "qualitykoi":
			you_give_qty_of_koi.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "koi")

func update_all_qty_given():
	you_give_qty_of_koi.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "koi")

func give_reward():
	print("give reward!")
	ItemData.unlock_rod_blueprint("TrainingRod")
	AreaData.unlock_area("TheLake")

func disable_all_buttons():
	give_koi_button.disabled = true
	give_quality_koi_button.disabled = true
#-----------------------------------











