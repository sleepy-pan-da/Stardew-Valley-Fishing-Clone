extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var try_rod = ItemData.Rods[PlayerData.equipped_rod].instance()
	try_rod.testing = try_rod.things_to_test[1] 
	add_child(try_rod)
	try_rod.global_position = Vector2(0, -30)




func _on_Button_pressed():
	get_tree().change_scene("res://Game/Loadout/Loadout.tscn")
