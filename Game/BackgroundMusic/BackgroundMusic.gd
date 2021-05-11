extends Node2D

onready var sea_sound = $SeaSound
onready var give_fish_sound = $GiveFishSound
var time_taken_to_beat_game = 0
var minutes_taken
var seconds_left

func _ready():
	sea_sound.play()
	
func _physics_process(delta):
	time_taken_to_beat_game += delta

func make_time_taken_readable():
	minutes_taken = round(time_taken_to_beat_game / 60)
	seconds_left = round(time_taken_to_beat_game - minutes_taken * 60)
	print(seconds_left)
	
func play_give_fish_sound():
	give_fish_sound.play()


