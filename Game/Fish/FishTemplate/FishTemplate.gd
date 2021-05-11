extends KinematicBody2D

var path = []
var index = 0
var next_destination
var direction_of_motion
var vertical_velocity
var fixed_position_x = 73.705 #this will change based on position of catching_ui

var max_upwards_velocity
var max_downwards_velocity
var caught = false
	
#setters------------------------------------	
func set_max_upwards_velocity(max_velocity):
	max_upwards_velocity = max_velocity

func set_max_downwards_velocity(max_velocity):
	max_downwards_velocity = max_velocity
#-------------------------------------------

func fish_reached_destination():
	if global_position.distance_to(next_destination) > 1:
		return false
	else:
		return true

func set_vertical_velocity():
	direction_of_motion = sign(next_destination.y - global_position.y)
	if(sign(direction_of_motion) == 1):
		vertical_velocity = direction_of_motion * max_downwards_velocity
	elif(sign(direction_of_motion) == -1):
		vertical_velocity = direction_of_motion * max_upwards_velocity
		
func get_next_destination_in_path():
	index = index % path.size()
	var destination = Vector2(fixed_position_x, path[index])
	index += 1
	print(destination)
	return destination

func get_initial_index():
	return index - 1

func is_caught():
	caught = true


