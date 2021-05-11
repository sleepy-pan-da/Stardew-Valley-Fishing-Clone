extends Button

signal sold_fish(monetary_value, fish_name)

var monetary_value = 0
var fish_name = ""
	
func set_monetary_value(new_value):
	monetary_value = new_value

func set_fish_name(new_name):
	fish_name = new_name

func update_text_on_button():
	text = fish_name + " " + "(" + str(monetary_value) + "G)"

func _on_FishButtonTemplate_pressed():
	print("sold " + fish_name + " for " + str(monetary_value) + "G")
	emit_signal("sold_fish", monetary_value, fish_name)
	queue_free()
