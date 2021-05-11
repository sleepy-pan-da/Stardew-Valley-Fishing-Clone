extends KinematicBody2D


onready var btm_raycast = $BtmRayCast
onready var top_raycast = $TopRayCast

#300
#10

#easy 
#100
#5

#lower acceleration/gravity + lower top velocity = easy controls
#higher acceleration/gravity + higher top velocity = hard but twitchy controls
#training/steady part of rod? affects acceleration/gravity


#notable traits that define motion of catchable area
var max_upwards_velocity = -100
var max_downwards_velocity = 100
var acceleration = -5
var gravity = 5
#-------------------------------------------------
var velocity = Vector2(0, 0)
var is_on = true
var is_pressed = false

func _ready():
	if PlayerData.has_perk("BiggerNet"):
		print("Bigger Net is taking effect")
		scale.y *= 1.25

func _input(event):
	if PlayerData.mobile_mode:
		if event is InputEventScreenTouch:
			if event.is_pressed():
				is_pressed = true
			else:
				is_pressed = false
	else:
		if Input.is_action_pressed("left_click"):
			is_pressed = true
		else:
			is_pressed = false

func _physics_process(_delta):
	if is_on:
		if is_pressed:
			go_up()
		else:
			go_down()
	
func turn_off():
	is_on = false
	
func go_up(): 
	if(is_at_the_ends()):
		reset_velocity()
	velocity.y += acceleration
	clamp_upwards_velocity()
	move_and_slide(velocity)
	
	
func go_down():
	if(is_at_the_ends()):
		reset_velocity()
	velocity.y += gravity
	clamp_downwards_velocity()
	move_and_slide(velocity)
	

func reset_velocity():
	velocity.y = 0

func clamp_upwards_velocity():
	if velocity.y < max_upwards_velocity: 
		velocity.y = max_upwards_velocity

func clamp_downwards_velocity():
	if velocity.y > max_downwards_velocity:
		velocity.y = max_downwards_velocity

func is_at_the_ends(): #check if at the top or btm ends of rod
	if (btm_raycast.is_colliding() or top_raycast.is_colliding()):
		return true
	return false




