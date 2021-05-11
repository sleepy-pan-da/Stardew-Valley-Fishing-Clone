extends Area2D

onready var collision_shape = $CollisionShape2D
var mouse_in_clickable_area 

func check_if_mouse_is_within_clickable_area():
	var mouse_position = get_global_mouse_position()
	var clickable_area = collision_shape.shape.extents * 2
	if mouse_position.x >= 0 and mouse_position.x <= clickable_area.x:
		if mouse_position.y >= 0 and mouse_position.y <= clickable_area.y:
			return true
	else:
		return false
	
func _on_ClickableArea_mouse_entered():
	mouse_in_clickable_area = true

func _on_ClickableArea_mouse_exited():
	mouse_in_clickable_area = false
	
