extends Node2D

var Bobber = preload("res://Game/Fishing/Bobber/Bobber.tscn")
var CatchingUI = ItemData.Rods[PlayerData.equipped_rod]
var thrown_bobber 
var catching_ui

func throw_bobber():
	thrown_bobber = Bobber.instance()
	add_child(thrown_bobber)
	thrown_bobber.global_position = position

func retrieve_bobber():
	if bobber_is_thrown():
		thrown_bobber.queue_free()

func is_bitten():
	if bobber_is_thrown():
		return thrown_bobber.is_bitten()
	else:
		print("null reference")
		return false

func bobber_is_thrown():
	if thrown_bobber != null:
		return true
	else:
		return false

func turn_off_bobber(): 
	if thrown_bobber != null:
		thrown_bobber.pause_bobber_animation_from_becoming_stale()

func create_catching_ui():
	catching_ui = CatchingUI.instance()
	add_child(catching_ui)
	catching_ui.global_position = Vector2(0, 0)
	catching_ui.connect("catch_unsuccessfully", get_parent(), 
	"go_back_to_main_screen_from_failing_to_catch_fish")
	
