extends Control

onready var gold_amount = $HBoxContainer/GoldAmount
onready var buttons_for_fishes_caught = $FishesCaught/ButtonsForFishesCaught
onready var coin_sound1 = $CoinSound1
onready var coin_sound2 = $CoinSound2
onready var coin_sounds = [coin_sound1, coin_sound2]

func _ready():
	update_gold_label()
	buttons_for_fishes_caught.instantiate_all_fish_buttons()

func update_gold_label():
	gold_amount.text = "Gold:" + str(PlayerData.gold_amount)
	
#this is called when fish is sold sucessfully
func update_player_status(revenue, fish_name): 
	update_gold_amount(revenue)
	PlayerData.remove_fish(fish_name)

func update_gold_amount(revenue):
	PlayerData.update_gold_amount(revenue)
	update_gold_label()
	play_coin_sound()
	
func play_coin_sound():
	randomize()
	var coin_sound_index = randi() % 2
	coin_sounds[coin_sound_index].play()

func _on_GoBackToMenuButton_pressed():
	get_tree().change_scene("res://Game/Camp/BaitShop/BaitShop.tscn")
