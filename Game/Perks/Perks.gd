extends Control

onready var description = $Description
onready var filled_perk_slots = $FilledPerkSlots

func _ready():
	update_filled_perk_slots_text()

func update_description(perk_name, button_pressed):
	if !button_pressed:
		if PlayerData.has_perk(perk_name):
			PlayerData.unequip_perk(perk_name)
			PlayerData.occupied_slots -= PerkData.PerkConsumption[perk_name]
		clear_description()
	else:
		if can_add_perk(PerkData.PerkConsumption[perk_name]):
			PlayerData.equip_perk(perk_name)
			description.text = PerkData.PerkDescriptions[perk_name]
			PlayerData.occupied_slots += PerkData.PerkConsumption[perk_name]
		else:
			description.text = "Insufficient perk slots!"
	update_filled_perk_slots_text()
	print(PlayerData.equipped_perks)

func can_add_perk(number_of_slots_occupied_by_added_perk):
	if (number_of_slots_occupied_by_added_perk + PlayerData.occupied_slots) > PlayerData.return_equipped_rod_perk_slots():
		return false
	else:
		return true

func update_filled_perk_slots_text():
	filled_perk_slots.text = "Filled Perk Slots " + str(PlayerData.occupied_slots) + "/" + str(PlayerData.return_equipped_rod_perk_slots())

func clear_description():
	description.text = ""

func _on_GoBackToMenuButton_pressed():
	if PlayerData.came_from_camp:
		PlayerData.came_from_camp = false
		get_tree().change_scene("res://Game/Loadout/Loadout.tscn")
	else:
		get_tree().change_scene("res://Game/Loadout/LoadoutFromFishing.tscn")
