extends Panel

#things to edit
onready var you_give_qty_of_herring = $VBoxContainer/FishProgressHerring/YouGave

onready var you_have_how_many_herring = $VBoxContainer/FishProgressHerring/YouHave

onready var you_have_how_many_herring_quality = $VBoxContainer/FishProgressHerring/YouHaveQuality

onready var give_herring_button = $VBoxContainer/FishProgressHerring/GiveHerring
onready var give_quality_herring_button = $VBoxContainer/FishProgressHerring/GiveQualityHerring
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
	update_you_have_how_many_fish_text("herring")
	update_you_have_how_many_fish_text("qualityherring")


func update_you_have_how_many_fish_text(fishname):
	match fishname:
		"herring":
			you_have_how_many_herring.text = "  You Have " + str(PlayerData.return_number_of_fish("herring")) + " herring"
		"qualityherring":
			you_have_how_many_herring_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualityherring")) + " quality"
	
func _on_GiveHerring_pressed():
	var fish_name = "herring"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityHerring_pressed():
	var fish_name = "qualityherring"
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
		"herring", "qualityherring":
			you_give_qty_of_herring.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "herring")

func update_all_qty_given():
	you_give_qty_of_herring.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "herring")

func give_reward():
	print("give reward!")
	ItemData.unlock_rod_blueprint("WoodenRod")
	AreaData.unlock_area("TheRiver")

func disable_all_buttons():
	give_herring_button.disabled = true
	give_quality_herring_button.disabled = true
#-----------------------------------














