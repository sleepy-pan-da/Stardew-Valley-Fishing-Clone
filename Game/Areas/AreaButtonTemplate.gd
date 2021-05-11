extends Button

var area_name = ""

func _ready():
	update_text_on_button()

func set_area_name(new_name):
	area_name = new_name

func update_text_on_button():
	text = area_name

func do_this_when_area_button_pressed():
	#resets the bait so as to prevent u from using baits in unintended areas
	FishData.fishes_at_area = [] #this prevents a scenario where you will 
	#try to catch fish that is not in the area
	#PlayerData.equip_bait("No bait") 
	get_tree().change_scene_to(AreaData.AvailableAreas[area_name])

func _on_AreaButtonTemplate_pressed():
	do_this_when_area_button_pressed()
