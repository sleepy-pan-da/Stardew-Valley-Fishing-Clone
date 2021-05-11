extends Control


onready var time_taken_to_beat_game = $TimeTakenToBeatGame
func _ready():
	BackgroundMusic.make_time_taken_readable()
	var minutes_taken = str(BackgroundMusic.minutes_taken)
	var seconds_left = str(BackgroundMusic.seconds_left)
	time_taken_to_beat_game.text = minutes_taken + "m " + seconds_left + "s" 



