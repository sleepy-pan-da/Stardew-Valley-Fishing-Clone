extends "res://Game/Fishing/Rods/CatchableArea.gd"

#150
#10

func _ready():
	max_upwards_velocity = -125
	max_downwards_velocity = 125
	acceleration = -5 #10
	gravity = 5
