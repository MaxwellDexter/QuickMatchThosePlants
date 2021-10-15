extends RayCast

signal clicked_object(object)

var looking_at

func _process(delta):
	var col = get_collider()
	if col != looking_at:
		print(looking_at)
		print(looking_at != null)
		if looking_at != null and is_instance_valid(looking_at):
			looking_at.targeted = false
		looking_at = col
		if col != null:
			looking_at.targeted = true

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		if is_colliding() and get_collider().is_clickable:
			emit_signal("clicked_object", get_collider())
