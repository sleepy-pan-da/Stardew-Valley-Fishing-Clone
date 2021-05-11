extends KinematicBody2D

onready var radial_progress = $RadialProgress
onready var sprite = $Sprite
onready var chest_opening_sound = $ChestOpeningSound

var is_on = true
var is_opened = false
var step_value = 1.5

signal update_progress_timed_out

func increment_value():
	radial_progress.value += step_value
	if progress_is_complete():
		open_chest()
	
func decrement_value():
	radial_progress.value -= step_value

func progress_is_complete():
	return radial_progress.value >= 100
	
func open_chest():
	chest_opening_sound.play()
	sprite.animation = "opened"
	is_opened = true
	is_on = false

func _on_UpdateProgress_timeout():
	emit_signal("update_progress_timed_out")
