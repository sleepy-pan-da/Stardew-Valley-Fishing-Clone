extends VBoxContainer


func _ready():
	instantiate_available_perk_buttons()

func instantiate_available_perk_buttons():
	var unlocked_perks = PerkData.UnlockedPerks.keys()
	for i in unlocked_perks:
		if PerkData.UnlockedPerks[i]:
			var perk_button_resource = PerkData.AllPerkButtons[i]
			var perk_button = perk_button_resource.instance()
			if PlayerData.has_perk(i):
				perk_button.pressed = true #retain button's previous state
			perk_button.connect("perk_button_toggled", get_parent().get_parent(), "update_description")
			add_child(perk_button)
			



