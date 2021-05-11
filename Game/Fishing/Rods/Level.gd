extends Node2D


onready var fish_start_position = $FishStartPosition

func _ready():
	print("Top:" + str($Top.position))
	print("Btm:" + str($Btm.position))

func get_fish_start_position():
	return fish_start_position.global_position

func get_random_position():
	randomize()
	return Vector2(get_fish_start_position().x, int(rand_range(30, 222)) )
#30

