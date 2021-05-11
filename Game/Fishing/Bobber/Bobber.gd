extends AnimatedSprite

onready var wait_time_before_first_bite = $WaitingTimeBeforeFirstBite
onready var wait_time_before_actual_bite = $WaitingTimeBeforeActualBite
onready var duration_of_actual_bite = $DurationOfActualBite
onready var state_timer = $StateTimer
onready var instructions = $Instructions

var bobber_state = ["NotBitten", "Bitten", "Stale"]

onready var BobberBehaviour = preload("BobberBehaviour.gd")
onready var bobber_behaviour = BobberBehaviour.new()

#setter and getter----------------------------------------------
func set_wait_time_before_actual_bite(new_time):
	wait_time_before_actual_bite.wait_time = new_time
	print("Wait time before actual bite:" + str(round(wait_time_before_actual_bite.wait_time)))

func get_wait_time_before_actual_bite():
	return wait_time_before_actual_bite.wait_time

func get_remaining_wait_time_before_actual_bite():
	return wait_time_before_actual_bite.time_left
#----------------------------------------------------------------

func _ready():
	randomize()
	throw_bobber_into_water()

func throw_bobber_into_water():
	animation = bobber_state[0]
	if PlayerData.equipped_bait != "No bait":
		#check if any fish will bite your bobber (maybe all the fish here require bait?) --for future reference--
		set_wait_time_before_actual_bite(bobber_behaviour.randomise_wait_time_before_actual_bite())
	else:
		set_wait_time_before_actual_bite(bobber_behaviour.randomise_wait_time_before_actual_bite() + 3)
	wait_time_before_actual_bite.start()
	
func _on_WaitingTimeBeforeActualBite_timeout():
	#update to bitten
	update_animation_and_label(1)
	duration_of_actual_bite.start()	

func _on_DurationOfActualBite_timeout():
	#update to stale
	update_animation_and_label(2)

func is_bitten():
	if animation == bobber_state[1]:
		return true
	else:
		return false

func update_animation_and_label(bobber_state_index):
	animation = bobber_state[bobber_state_index]

func pause_bobber_animation_from_becoming_stale():
	duration_of_actual_bite.stop()

func _on_InstructionsFadeOut_timeout():
	instructions.hide()
