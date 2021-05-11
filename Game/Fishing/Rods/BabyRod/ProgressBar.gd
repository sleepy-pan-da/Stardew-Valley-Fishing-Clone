extends "res://Game/Fishing/Rods/ProgressBar.gd"


func set_up_progress_bar_traits():
	set_progress_step(3)
	set_value_required_to_catch_fish(250)
	set_starting_value(0)
