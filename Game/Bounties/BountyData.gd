extends Node

onready var BountyProgress = {
	"ThePond":	{
		"Bounty1":	{
						"goldfish":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"guppy":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"flyingfish":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"progress":		{
							"Completed":		0,
							"Total":			3
						}
					},
					
		"Bounty2":	{
						"biggergoldfish":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"biggerguppy":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"progress":		{
							"Completed":		0,
							"Total":			2
						}
			
					},
		
		"Bounty3":	{
						"koi":		{
							"YouGave":			0,
							"Requirement":		3
						},
						
						"progress":		{
							"Completed":		0,
							"Total":			1
						}
			
					},
					
				},
	
	"TheLake":	{
		"Bounty1":	{
						"anchovy":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"sardine":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"tuna":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"progress":		{
							"Completed":		0,
							"Total":			3
						}
					},
					
		"Bounty2":	{
						"cod":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"pike":		{
							"YouGave":			0,
							"Requirement":		3
						},
						"progress":		{
							"Completed":		0,
							"Total":			2
						}
			
					},
		
		"Bounty3":	{
						"herring":		{
							"YouGave":			0,
							"Requirement":		3
						},
						
						"progress":		{
							"Completed":		0,
							"Total":			1
						}
			
					},
					
				}
}


func give_fish_to_bounty(bounty_number, fish_name):
	BountyProgress[PlayerData.current_area][bounty_number][fish_name]["YouGave"] += 1
	
	
func give_quality_fish_to_bounty(bounty_number, fish_name):
	BountyProgress[PlayerData.current_area][bounty_number][fish_name]["YouGave"] += 3
	
func check_if_given_qty_met_requirement(bounty_number, fish_name):
	return BountyProgress[PlayerData.current_area][bounty_number][fish_name]["YouGave"] >= BountyProgress[PlayerData.current_area][bounty_number][fish_name]["Requirement"]

func update_bounty_progress(bounty_number):
	BountyProgress[PlayerData.current_area][bounty_number]["progress"]["Completed"] += 1
	
func check_if_completed_bounty(bounty_number):
	return BountyProgress[PlayerData.current_area][bounty_number]["progress"]["Completed"] >= BountyProgress[PlayerData.current_area][bounty_number]["progress"]["Total"]
	
func get_fish_given_qty_and_requirement_based_on_bounty(bounty_number, fish_name):
	return "  You gave " + str(BountyProgress[PlayerData.current_area][bounty_number][fish_name]["YouGave"]) + "/" + str(BountyProgress[PlayerData.current_area][bounty_number][fish_name]["Requirement"]) + " " + fish_name

	
	
