extends Area2D



var fish_in_catchable_area = false
var treasure_in_catchable_area = false
var perfect_catch = true
var chance = 1

signal fish_entered_hitbox
signal fish_exited_hitbox
signal second_chance_given

func _on_HitBox_body_entered(body):
	if body.is_in_group("Fish"):
		fish_in_catchable_area = true
		emit_signal("fish_entered_hitbox")
	elif body.is_in_group("Treasure"):
		treasure_in_catchable_area = true

func _on_HitBox_body_exited(body):
	if body.is_in_group("Fish"):
		if perfect_catch:
			if PlayerData.has_perk("SecondChance") and chance == 1:
				print("Second Chance is taking effect")
				chance -= 1
				emit_signal("second_chance_given")
			else:
				perfect_catch = false
		fish_in_catchable_area = false
		emit_signal("fish_exited_hitbox")
	elif body.is_in_group("Treasure"):
		treasure_in_catchable_area = false
