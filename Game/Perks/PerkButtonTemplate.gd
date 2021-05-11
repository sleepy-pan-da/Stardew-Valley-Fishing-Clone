extends Button


signal perk_button_toggled(perk_name, button_pressed)


func _on_PerkButtonTemplate_toggled(button_pressed):
	if button_pressed:
		emit_signal("perk_button_toggled", name, true)
	else:
		emit_signal("perk_button_toggled", name, false)
