extends "res://Game/Areas/AreaTemplate.gd"

func _ready():
	update_player_current_area("TheLake")

func _on_FishButton_pressed():
	get_tree().change_scene_to(AreaData.FishingAreas["TheLake"]["Path"])

func _on_BountyButton_pressed():
	get_tree().change_scene_to(AreaData.BountyAreas["TheLake"])

