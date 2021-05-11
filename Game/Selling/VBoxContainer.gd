extends VBoxContainer

func instantiate_all_fish_buttons():
	var index = 0
	for i in PlayerData.fish_caught:
		instantiate_a_fish_button(i, index)
		index += 1
			

func instantiate_a_fish_button(fish_name, index):
	var fish_button_resource = FishData.FishButton[fish_name]
	var fish_button = fish_button_resource.instance()
	fish_button.set_monetary_value(PlayerData.fish_cost[index])
	fish_button.connect("sold_fish", get_parent().get_parent(), "update_player_status")
	add_child(fish_button)


