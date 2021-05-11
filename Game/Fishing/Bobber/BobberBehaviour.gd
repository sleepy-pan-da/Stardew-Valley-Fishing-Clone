extends Node
class_name BobberBehaviour

const MINIMUMWAITINGTIME = 3
const WAITINGTHRESHOLD = 3

var waiting_time

func randomise_wait_time_before_actual_bite():
	#waiting_time is minimum when (randi() % WAITINGTHRESHOLD) = 0
	if PlayerData.has_perk("FishCharmer"):
		print("Fish Charmer is taking effect")
		waiting_time = ((randi() % 1) + MINIMUMWAITINGTIME)
	else:
		waiting_time = ((randi() % WAITINGTHRESHOLD) + MINIMUMWAITINGTIME)
	return waiting_time
	
	
	

