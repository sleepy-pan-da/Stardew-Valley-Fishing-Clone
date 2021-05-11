extends "res://Game/Fish/FishTemplate/FishTemplate.gd"

var waiting_at_start = true

func _ready():
	path = [200, 210, 30, 222, 30, 50, 30, 222]
	set_max_upwards_velocity(90)
	set_max_downwards_velocity(90)
	next_destination = get_next_destination_in_path()
	
func _physics_process(_delta):
	if !caught:
		if fish_reached_destination():
			next_destination = get_next_destination_in_path()
		else:
			if !waiting_at_start:
				set_vertical_velocity()
				move_and_slide(Vector2(0, vertical_velocity))




func _on_WaitAtStartTimer_timeout():
	waiting_at_start = false
