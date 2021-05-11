extends VBoxContainer

var area_button_resource = preload("res://Game/Areas/AreaButtonTemplate.tscn")

func _ready():
	instantiate_all_unlocked_location_buttons()

func instantiate_all_unlocked_location_buttons():
	for area_name in AreaData.AvailableAreas:
		if area_is_unlocked(area_name):
			instance_an_area_button(area_name)

func area_is_unlocked(area_name):
	return AreaData.UnlockedAreas[area_name]

func instance_an_area_button(area_name):
	var area_button = area_button_resource.instance()
	area_button.set_area_name(area_name)
	add_child(area_button)


	
