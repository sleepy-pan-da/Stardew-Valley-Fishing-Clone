extends Node2D

onready var instance_manager = $InstanceManager
onready var successfull_pull_sound = $SuccessfullPullSound
onready var unsuccessfull_pull_sound = $UnsuccessfullPullSound
onready var cast_rod_sound = $CastRodSound
onready var go_back_to_menu_button = $GoBackToMenuButton
onready var equipped_loadout = $EquippedLoadout
onready var area_experience = $AreaExperience
onready var area_experience_progress_bar = $AreaExperienceProgressBar
onready var percent = $AreaExperienceProgressBar/Percent
onready var fishing_area_info = $FishingAreaInfo
onready var check_rod_level_indicator = $CheckRodLevelIndicator
onready var fishing_button = $FishingButton
onready var loadout_button = $LoadoutButton
onready var notification = $Notification


var created_catching_ui = false


func _ready():
	print("hi")
	update_player_current_fishing_area_to_be_overriden()
	update_fishing_area_info()
	if check_if_you_can_fish_with_equipped_rod():
		update_check_rod_level_indicator(true)
	else:
		update_check_rod_level_indicator(false)
		fishing_button.disabled = true
	update_equipped_loadout()

#func _input(event):
#	if PlayerData.mobile_mode:
#		if event is InputEventScreenTouch and event.is_pressed():
#			if !created_catching_ui:
#				if(instance_manager.bobber_is_thrown()):
#					fishing_result_behave_based_on_bobber_state()
#				else:
#					cast_rod()
#			#else do nothing as catching_ui will be instantiated over this
#	else:
#		if Input.is_action_just_pressed("left_click") and clickable_area.mouse_in_clickable_area:
#			if !created_catching_ui:
#				if(instance_manager.bobber_is_thrown()):
#					fishing_result_behave_based_on_bobber_state()
#				else:
#					cast_rod()
#			#else do nothing as catching_ui will be instantiated over this

func check_if_you_can_fish_with_equipped_rod():
	return PlayerData.return_equipped_rod_level() >= PlayerData.return_current_fishing_area_level()

func update_check_rod_level_indicator(can_fish_with_equipped_rod):
	var equipped_rod_level = str(PlayerData.return_equipped_rod_level())
	if can_fish_with_equipped_rod:
		check_rod_level_indicator.text = "Rod Level: " + equipped_rod_level + "\n" + "You can fish here with this rod!"
	else:
		check_rod_level_indicator.text = "Rod Level: " + equipped_rod_level + "\n" + "Rod level is too low!"




func _on_FishingButton_pressed():
	if !created_catching_ui:
		if(instance_manager.bobber_is_thrown()):
			fishing_result_behave_based_on_bobber_state()
		else:
			cast_rod()
			fishing_button.text = "Pull Rod"
			notification.hide()
		#else do nothing as catching_ui will be instantiated over this
		

func update_player_current_fishing_area_to_be_overriden():
	update_player_current_fishing_area(name)

func update_player_current_fishing_area(name):
	PlayerData.current_fishing_area = name

func update_fishing_area_info():
	var area_name = PlayerData.current_fishing_area
	fishing_area_info.text = area_name + "\n" + "Area Level: " + str(AreaData.return_fishing_area_level(area_name))
	update_area_experience()

func update_area_experience():
	var current_fishing_area = PlayerData.current_fishing_area
	area_experience.bbcode_text = AreaData.FishingAreas[current_fishing_area]["AreaExperience"]
	area_experience_progress_bar.value = AreaData.FishingAreas[current_fishing_area]["AreaExperiencePts"]
	percent.text = str(AreaData.FishingAreas[current_fishing_area]["AreaExperiencePts"]) + "%" 
	if AreaData.just_leveled_up_area_experience:
		AreaData.just_leveled_up_area_experience = false
		notification.bbcode_text = AreaData.FishingAreasLvlUpNotifications[current_fishing_area][area_experience.text]
		#notification to ui
	
func update_equipped_loadout():
	if PlayerData.equipped_bait != "No bait":
		equipped_loadout.text = "Rod: " + PlayerData.equipped_rod + "\n" + "Bait: " + PlayerData.equipped_bait + "\n" + "qty: " + str(PlayerData.get_qty_of_equipped_bait())
	else:
		equipped_loadout.text = "Rod: " + PlayerData.equipped_rod + "\n" + "Bait: " + PlayerData.equipped_bait

func fishing_result_behave_based_on_bobber_state():
	if(instance_manager.is_bitten()):
		pulled_successfully()
	else:
		pulled_unsuccessfully()
		notification.show()	

func pulled_successfully():
	created_catching_ui = true
	successfull_pull_sound.play()
	instance_manager.turn_off_bobber()
	yield(get_tree().create_timer(0.6), "timeout")
	hide_ui()
	instance_manager.create_catching_ui()
	instance_manager.retrieve_bobber()

#this is called when you click the bobber when it is not in the bitten state
func pulled_unsuccessfully():
	unsuccessfull_pull_sound.play()
	retrieve_rod()

func cast_rod():
	instance_manager.throw_bobber()
	cast_rod_sound.play()

func retrieve_rod():
	update_ui()
	instance_manager.retrieve_bobber()

func update_ui():
	fishing_button.text = "Go Fishing!"

func hide_ui():
	area_experience.hide()
	area_experience_progress_bar.hide()
	fishing_area_info.hide()
	equipped_loadout.hide()
	check_rod_level_indicator.hide()
	go_back_to_menu_button.hide()
	fishing_button.hide()
	loadout_button.hide()

func show_ui():
	area_experience.show()
	area_experience_progress_bar.show()
	fishing_area_info.show()
	equipped_loadout.show()
	check_rod_level_indicator.show()
	go_back_to_menu_button.show()
	fishing_button.show()
	loadout_button.show()
	
	
func go_back_to_main_screen_from_failing_to_catch_fish():
	update_equipped_loadout()
	retrieve_rod()
	show_ui()
	update_area_experience()
	created_catching_ui = false

func _on_GoBackToMenuButton_pressed():
	get_tree().change_scene_to(PlayerData.return_current_area_path())

func _on_LoadoutButton_pressed():
	get_tree().change_scene("res://Game/Loadout/LoadoutFromFishing.tscn")
