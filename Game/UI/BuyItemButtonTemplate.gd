extends Button

#button will queue_free()
signal buy_item(monetary_value, show_qty_of_bought_item, item_name)
#if show_qty_of_bought_item == false
#indicator of shop will not show qty of item u own

var monetary_value = 0
var item_name = ""
	
	
func update_text_on_button():
	text = item_name + " " + "(" + str(monetary_value) + "G)"	
	
#setters--------------------------	
func set_monetary_value(new_value):
	monetary_value = new_value

func set_item_name(new_name):
	item_name = new_name
#---------------------------------	

func do_this_when_item_button_pressed():
	execute_button_behaviour()
	print("buy " + item_name + " for " + str(monetary_value) + "G")
	emit_signal("buy_item", monetary_value, false, item_name)

func execute_button_behaviour(): #allow you to add code to the template when script is inherited
	pass

func got_enough_gold():
	if monetary_value > PlayerData.gold_amount:
		return false
	else:
		return true
		
func _on_BuyItemButtonTemplate_pressed():
	if got_enough_gold():
		do_this_when_item_button_pressed()
		queue_free()
	else:
		print("not enough money")
