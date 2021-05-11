extends Control

#button will queue_free()
signal buy_item()
#if show_qty_of_bought_item == false
#indicator of shop will not show qty of item u own

onready var you_own = $YouOwn

var monetary_value = 0
var item_name = ""
	
	
#setters--------------------------	
func set_monetary_value(new_value):
	monetary_value = new_value

func set_item_name(new_name):
	item_name = new_name
#---------------------------------	

func got_enough_gold():
	if monetary_value > PlayerData.gold_amount:
		return false
	else:
		return true

func _on_BuyButton_pressed():
	if got_enough_gold():
		#play coin sound
		PlayerData.update_gold_amount(-monetary_value)
		PlayerData.add_to_inventory("baits", item_name)
		update_qty_of_bait()
		emit_signal("buy_item")
		print("bought bait")
		#mark some singleton that this is unlocked already
	else:
		#play not enuf cash sound
		print("cannot buy bait")

func update_qty_of_bait():
	you_own.text = "   You own: " + str(PlayerData.get_qty_of_bait(item_name))
	
	
