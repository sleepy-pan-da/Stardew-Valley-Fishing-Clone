extends "res://Game/Fish/FishTemplate/FishTemplate.gd"	

onready var stationary_timer = $StationaryTimer

var stay_still = []
var timer_started = false

func _ready():
	path = [100, 150]
	stay_still = [true, true]
	set_max_upwards_velocity(50)
	set_max_downwards_velocity(100)
	next_destination = get_next_destination_in_path()
	
func _physics_process(_delta):
	if !caught:
		if fish_reached_destination():
			if stay_still[get_initial_index()] and timer_started == false:	
				stationary_timer.start()
				timer_started = true
				vertical_velocity = 0

			elif stay_still[get_initial_index()] == false:

				next_destination = get_next_destination_in_path()	
			
		else:
			set_vertical_velocity()
			move_and_slide(Vector2(0, vertical_velocity))

func _on_StationaryTimer_timeout():
	next_destination = get_next_destination_in_path()
	timer_started = false
