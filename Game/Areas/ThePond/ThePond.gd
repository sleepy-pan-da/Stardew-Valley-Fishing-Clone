extends "res://Game/Areas/AreaTemplate.gd"

func _ready():
	update_player_current_area("ThePond")

func _on_FishButton_pressed():
	print(AreaData.FishingAreas["ThePond"]["Path"])
	get_tree().change_scene_to(AreaData.FishingAreas["ThePond"]["Path"])

func _on_BountyButton_pressed():
	get_tree().change_scene_to(AreaData.BountyAreas["ThePond"])

