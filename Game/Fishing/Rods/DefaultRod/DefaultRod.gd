extends Node2D

signal catch_unsuccessfully

onready var catchable_area = $CatchableArea
onready var catchable_area_hit_box = $CatchableArea/HitBox
onready var progress_bar = $Level/ProgressBar
onready var successful_catch_sound = $SuccessfullCatchSound
onready var unsuccessful_catch_sound = $UnsuccessfullCatchSound
onready var transition_from_unsuccessful_catch_timer = $TransitionFromUnsuccessfulCatchTimer
onready var transition_to_reward_timer = $TransitionToRewardTimer
onready var level = $Level
onready var perfect_label = $PerfectLabel
onready var unscathed_bait_label = $UnscathedBaitLabel
onready var second_chance_label = $SecondChanceLabel

var fish
var fish_name
var treasure_chest
var things_to_test = ["fish", "rod", "treasure", "false"]
var testing = things_to_test[3] 

func _ready():
	if PlayerData.has_perk("SecondChance"):
		catchable_area_hit_box.connect("second_chance_given", self, "show_second_chance_label")
	if testing == "fish" or testing == "false":
		if can_generate_treasure_chest():
			generate_treasure_chest()
		generate_fish_that_bit_rod()
		progress_bar.connect("progress_bar_filled", self, "update_ui_about_successful_catch")
		progress_bar.connect("progress_bar_emptied", self, "update_ui_about_unsuccessful_catch")
		catchable_area_hit_box.connect("fish_entered_hitbox", self, "turn_catchable_area_white")
		catchable_area_hit_box.connect("fish_exited_hitbox", self, "turn_catchable_area_black")
	elif testing == "treasure":
		generate_treasure_chest()

func generate_fish_that_bit_rod():
	var fish_resource
	if testing == "fish":
		fish_resource = test_rod_feel_with_fish("TheLake", "Explored", "herring")
	elif testing == "false":
		var current_area_experience = AreaData.return_area_experience(PlayerData.current_fishing_area)
		#fish is now generated pseudo-randomly
		if FishData.check_if_fishes_at_area_is_empty():
			FishData.populate_fishes_at_area(PlayerData.current_fishing_area, current_area_experience)
		#a fish will be selected and removed randomly from the fishes_at_area array
		var index = FishData.generate_index_from_fishes_at_area()
		fish_name = FishData.fishes_at_area[index] # this is to let the rest of the script to know the fish name
		fish_resource = FishData.generate_fish_from_fishes_at_area(index)
	fish = fish_resource.instance()
	level.add_child(fish)
	fish.global_position = level.get_fish_start_position()

func generate_treasure_chest():
	treasure_chest = ItemData.treasure_chest_resource.instance()
	randomize()
	treasure_chest.global_position = Vector2(71.705, rand_range(30, 222))
	add_child(treasure_chest)
	print(treasure_chest.global_position)
	treasure_chest.connect("update_progress_timed_out", self, "update_treasure_chest_progress")
	print("treasure chest is here")

func can_generate_treasure_chest():
	var spawn_chest = false
	var can_spawn_chest = true
	if spawn_chest:
		return true
	elif can_spawn_chest:
		randomize()
		var rng = randi() % 10 
		print("rng:" + str(rng))
		if PlayerData.has_perk("TreasureMagnet"):
			print("Treasure Magnet is taking effect")
			return rng <= 3 # 40% chance of treasure spawning
		else:
			return rng <= 1 # 20% chance of treasure spawning
	else:
		return false
		
func update_treasure_chest_progress():
	if treasure_chest.is_on:
		if catchable_area_hit_box.treasure_in_catchable_area:
			treasure_chest.increment_value()
		else:
			treasure_chest.decrement_value()

func _on_UpdateBar_timeout():
	if progress_bar.is_on:
		if catchable_area_hit_box.fish_in_catchable_area:
			progress_bar.increment_progress_bar()
		else:
			progress_bar.decrement_progress_bar()

#when progress bar is filled or emptied		
func update_ui_about_successful_catch():
	end_catch()
	if treasure_chest_is_opened(): #treasure can only be opened for a successful catch
		PlayerData.opened_chest = true
	fish.is_caught()
	successful_catch_sound.play()
	show_perfect_label_if_perfect_catch()
	PlayerData.add_fish(fish_name)
	if AreaData.FishingAreas[PlayerData.current_fishing_area]["AreaExperience"] != "Explored":
		AreaData.add_area_experience_pts(FishData.FishExp[fish_name], PlayerData.current_fishing_area)
	transition_to_reward_timer.start()
	
func update_ui_about_unsuccessful_catch():
	end_catch()
	if PlayerData.has_perk("KuehLapis"):
		print("Resetted KuehLapis streak")
		PlayerData.kueh_lapis_streak = 0
	unsuccessful_catch_sound.play()
	transition_from_unsuccessful_catch_timer.start()	
#-----------------------------------------

func show_perfect_label_if_perfect_catch():
	if catchable_area_hit_box.perfect_catch:
		perfect_label.show()
		fish_name = "quality" + fish_name
	
func end_catch():
	if PlayerData.has_perk("UnscathedBait"):
		print("Trying your luck with Unscathed Bait")
		randomize()
		var rng = randi() % 2 # 50% chance bait will go unscathed
		if rng == 1:
			decrement_bait()
		else:
			unscathed_bait_label.show()
			print("Your bait is saved!")
	else:
		decrement_bait()
	catchable_area.turn_off()	
	if treasure_chest != null:
		treasure_chest.is_on = false
			
func treasure_chest_is_opened():
	if treasure_chest != null:
		return treasure_chest.is_opened	

#timeouts from successful/unsuccessful catch
func _on_TransitionFromUnsuccessfulCatchTimer_timeout():
	emit_signal("catch_unsuccessfully")
	queue_free()

func _on_TransitionToRewardTimer_timeout():
	show_fish_reward()
#------------------------------------------

#this is called when fish enter catchable area
func turn_catchable_area_white():
	catchable_area.modulate = Color(1,1,1,1)

#this is called when fish exit catchable area	
func turn_catchable_area_black():
	catchable_area.modulate = Color(0,0,0,1)

func show_fish_reward():
	var fish_reward_resource = FishData.FishReward
	get_tree().change_scene(fish_reward_resource)

func decrement_bait():
	if(PlayerData.equipped_bait != "No bait"):
		PlayerData.subtract_bait_from_inventory(PlayerData.equipped_bait)
		PlayerData.update_equipped_bait_when_run_out()

func show_second_chance_label():
	second_chance_label.show()
	yield(get_tree().create_timer(3), "timeout")
	second_chance_label.hide()

#for testing purposes
func test_rod_feel_with_fish(fisharea, area_experience, fishname):
	fish_name = fishname
	return FishData.FishAt[fisharea][area_experience][fishname]
