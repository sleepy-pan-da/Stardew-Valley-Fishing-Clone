extends VBoxContainer

onready var bait_option_button = $BaitOptionButton
onready var bait_description = $BaitDescription
onready var rod_option_button = $RodOptionButton
onready var rod_description = $RodDescription
onready var qty_of_bait = $QtyOfBait


func _ready():
	initialise_option_buttons()

func initialise_option_buttons():
	initialise_bait_option_button()
	initialise_rod_option_button()
	
func initialise_bait_option_button():
	bait_option_button.add_item(PlayerData.default_bait)
	for i in PlayerData.inventory["baits"]:
		bait_option_button.add_item(i)
	remind_option_button_equipped_item(bait_option_button, PlayerData.equipped_bait)
	update_qty_of_bait_label(PlayerData.equipped_bait)
	update_bait_description(PlayerData.equipped_bait)

func initialise_rod_option_button():
	rod_option_button.add_item(PlayerData.default_rod) 
	for i in ItemData.UnlockedRods: #rods are no longer initialised from inventory
		if ItemData.UnlockedRods[i]:
			rod_option_button.add_item(i)
	remind_option_button_equipped_item(rod_option_button, PlayerData.equipped_rod)
	update_rod_description(PlayerData.equipped_rod)

func remind_option_button_equipped_item(option_button_name, current_equipped_item):
	var current_index = get_index_of_current_equipped_item(option_button_name, current_equipped_item)
	option_button_name.selected = current_index
	
func get_index_of_current_equipped_item(option_button_name, current_equipped_item):
	var size = option_button_name.get_item_count()
	for index in size:
		var item_name = option_button_name.get_item_text(index)
		if current_equipped_item == item_name:
			return index	

func update_qty_of_bait_label(bait_name):
	if bait_name != "No bait":
		var qty = PlayerData.get_qty_of_bait(bait_name)
		qty_of_bait.text = "  Qty: " + str(qty)
	else:
		qty_of_bait.text = ""

func _on_BaitOptionButton_item_selected(index):
	var bait_name = bait_option_button.get_item_text(index)
	print("You selected " + bait_name)
	update_qty_of_bait_label(bait_name)
	PlayerData.equip_bait(bait_name)
	update_bait_description(bait_name)

func update_bait_description(bait_name):
	bait_description.text = ItemData.BaitDescription[bait_name]

func _on_RodOptionButton_item_selected(index):
	var rod_name = rod_option_button.get_item_text(index)
	print("You selected " + rod_name)
	PlayerData.equip_rod(rod_name)
	update_rod_description(rod_name)

func update_rod_description(rod_name):
	rod_description.text = ItemData.RodDescription[rod_name]
