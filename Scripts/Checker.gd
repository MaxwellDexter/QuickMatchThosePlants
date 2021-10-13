extends RayCast

signal clicked_object(object)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if is_colliding() and get_collider().is_clickable:
			emit_signal("clicked_object", get_collider())
