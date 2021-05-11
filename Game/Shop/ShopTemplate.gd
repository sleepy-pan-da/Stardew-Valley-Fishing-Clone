extends Control

onready var gold_amount = $GoldAmount
onready var items = $ItemsOnSale/Items
onready var coin_sound1 = $CoinSound1
onready var coin_sound2 = $CoinSound2
onready var coin_sounds = [coin_sound1, coin_sound2]
onready var enter_shop_sound = $EnterShopSound

var path = ""

func _ready():
	enter_shop_sound.play()
	update_gold_label()
	
#this is called when u successfully buy an item	
func update_player_status(): 
	update_gold_amount()

func update_gold_amount():
	update_gold_label()
	play_coin_sound()	

func update_gold_label():
	gold_amount.text = "Gold:" + str(PlayerData.gold_amount)
	
func play_coin_sound():
	randomize()
	var coin_sound_index = randi() % 2
	coin_sounds[coin_sound_index].play()

func _on_GoBackToMenuButton_pressed():
	if path == "":
		get_tree().change_scene("res://Game/Areas/TheCamp/TheCamp.tscn")
	else:
		get_tree().change_scene(path)
	
func set_path(desired_path):
	path = desired_path

func set_shop_items(desired_shop):
	items.shop_items = desired_shop


	
