extends RayCast

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if is_colliding():
			clicked_on(get_collider())

func clicked_on(clickee):
	print(clickee)
