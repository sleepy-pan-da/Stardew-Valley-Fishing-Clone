extends "res://Game/Fish/FishTemplate/FishTemplate.gd"


func _ready():
	path = [30, 222]
	set_max_upwards_velocity(50)
	set_max_downwards_velocity(50)
	next_destination = get_next_destination_in_path()
	
func _physics_process(_delta):
	if !caught:
		if fish_reached_destination():
			next_destination = get_next_destination_in_path()
		else:
			set_vertical_velocity()
			move_and_slide(Vector2(0, vertical_velocity))
	



