extends Panel

#things to edit
onready var you_give_qty_of_goldfish = $VBoxContainer/FishProgressGoldfish/YouGave
onready var you_give_qty_of_guppy = $VBoxContainer/FishProgressGuppy/YouGave
onready var you_give_qty_of_flyingfish = $VBoxContainer/FishProgressFlyingfish/YouGave

onready var you_have_how_many_goldfish = $VBoxContainer/FishProgressGoldfish/YouHave
onready var you_have_how_many_guppy = $VBoxContainer/FishProgressGuppy/YouHave
onready var you_have_how_many_flyingfish = $VBoxContainer/FishProgressFlyingfish/YouHave

onready var you_have_how_many_goldfish_quality = $VBoxContainer/FishProgressGoldfish/YouHaveQuality
onready var you_have_how_many_guppy_quality = $VBoxContainer/FishProgressGuppy/YouHaveQuality
onready var you_have_how_many_flyingfish_quality = $VBoxContainer/FishProgressFlyingfish/YouHaveQuality

onready var give_goldfish_button = $VBoxContainer/FishProgressGoldfish/GiveGoldfish
onready var give_quality_goldfish_button = $VBoxContainer/FishProgressGoldfish/GiveQualityGoldfish
onready var give_guppy_button = $VBoxContainer/FishProgressGuppy/GiveGuppy
onready var give_quality_guppy_button = $VBoxContainer/FishProgressGuppy/GiveQualityGuppy
onready var give_flyingfish_button = $VBoxContainer/FishProgressFlyingfish/GiveFlyingfish
onready var give_quality_flyingfish_button = $VBoxContainer/FishProgressFlyingfish/GiveQualityFlyingfish
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
	update_you_have_how_many_fish_text("goldfish")
	update_you_have_how_many_fish_text("qualitygoldfish")
	update_you_have_how_many_fish_text("guppy")
	update_you_have_how_many_fish_text("qualityguppy")
	update_you_have_how_many_fish_text("flyingfish")
	update_you_have_how_many_fish_text("qualityflyingfish")


func update_you_have_how_many_fish_text(fishname):
	match fishname:
		"goldfish":
			you_have_how_many_goldfish.text = "  You Have " + str(PlayerData.return_number_of_fish("goldfish")) + " goldfish"
		"qualitygoldfish":
			you_have_how_many_goldfish_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualitygoldfish")) + " quality"
		"guppy":
			you_have_how_many_guppy.text = "  You Have " + str(PlayerData.return_number_of_fish("guppy")) + " guppy"
		"qualityguppy":
			you_have_how_many_guppy_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualityguppy")) + " quality"
		"flyingfish":
			you_have_how_many_flyingfish.text = "  You Have " + str(PlayerData.return_number_of_fish("flyingfish")) + " flyingfish"
		"qualityflyingfish":
			you_have_how_many_flyingfish_quality.text = "  You Have " + str(PlayerData.return_number_of_fish("qualityflyingfish")) + " quality"

	
func _on_GiveGoldfish_pressed():
	var fish_name = "goldfish"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityGoldfish_pressed():
	var fish_name = "qualitygoldfish"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveGuppy_pressed():
	var fish_name = "guppy"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityGuppy_pressed():
	var fish_name = "qualityguppy"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveFlyingfish_pressed():
	var fish_name = "flyingfish"
	bounty_behaves_based_on_whether_you_have_fish(fish_name)


func _on_GiveQualityFlyingfish_pressed():
	var fish_name = "qualityflyingfish"
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
		"goldfish", "qualitygoldfish":
			you_give_qty_of_goldfish.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "goldfish")
		"guppy", "qualityguppy":
			you_give_qty_of_guppy.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "guppy")
		"flyingfish", "qualityflyingfish":
			you_give_qty_of_flyingfish.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "flyingfish")

func update_all_qty_given():
	you_give_qty_of_goldfish.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "goldfish")
	you_give_qty_of_guppy.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "guppy")
	you_give_qty_of_flyingfish.text = BountyData.get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, "flyingfish")
	
func give_reward():
	print("give reward!")
	AreaData.unlock_area("TheCamp")

func disable_all_buttons():
	give_goldfish_button.disabled = true
	give_quality_goldfish_button.disabled = true
	give_guppy_button.disabled = true
	give_quality_guppy_button.disabled = true
	give_flyingfish_button.disabled = true
	give_quality_flyingfish_button.disabled = true
#-----------------------------------





