extends "res://Game/Areas/AreaTemplate.gd"

func _ready():
	update_player_current_area("TheCamp")


func _on_BaitShop_pressed():
	get_tree().change_scene("res://Game/Camp/BaitShop/BaitShop.tscn")


func _on_RodSmith_pressed():
	get_tree().change_scene("res://Game/Shop/RodSmith/RodSmith.tscn")
	

func _on_CartographerButton_pressed():
	get_tree().change_scene("res://Game/Shop/Cartographer/Cartographer.tscn")


func _on_TrainerButton_pressed():
	get_tree().change_scene("res://Game/Shop/Trainer/Trainer.tscn")


func _on_Loadout_pressed():
	get_tree().change_scene("res://Game/Loadout/Loadout.tscn")




