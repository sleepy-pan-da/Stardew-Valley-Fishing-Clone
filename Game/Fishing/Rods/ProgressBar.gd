extends ProgressBar

signal progress_bar_filled
signal progress_bar_emptied

var is_on = true 

#notable traits that make up a rod
var progress_step = 1.5
var value_required_to_catch_fish = 200
var starting_value = 0
#---------------------------------

func _ready():
	set_up_progress_bar_traits()
	set_up_progress_bar_values()

func set_up_progress_bar_traits(): #will be overridden
	pass

func set_up_progress_bar_values():
	max_value = value_required_to_catch_fish
	value = starting_value

func set_progress_step(new_step):
	if PlayerData.has_perk("HotShot"):
		print("Hot Shot is taking effect")
		progress_step = new_step * 2
	else:
		progress_step = new_step

func set_starting_value(new_starting_value):
	if PlayerData.has_perk("HeadStart"):
		print("Head Start is taking effect")
		starting_value = 40 + starting_value
	else:
		starting_value = new_starting_value

func set_value_required_to_catch_fish(new_value):
	if PlayerData.has_perk("ShorterFinishLine"):
		print("shorter Finish Line is taking effect")
		value_required_to_catch_fish = new_value * 0.8
	else:
		value_required_to_catch_fish = new_value

func increment_progress_bar():
	value += progress_step
	clamp_progress_bar_value()
	
func decrement_progress_bar():
	value -= progress_step
	clamp_progress_bar_value()
	
func clamp_progress_bar_value():
	if is_progress_bar_full():
		value = value_required_to_catch_fish
		is_on = false
		emit_signal("progress_bar_filled")
	elif is_progress_bar_empty():
		value = 0	
		is_on = false
		emit_signal("progress_bar_emptied")
	
func is_progress_bar_full():
	if value >= max_value:
		return true
	return false

func is_progress_bar_empty():
	if value <= min_value:
		return true
	return false


