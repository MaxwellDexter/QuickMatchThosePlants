extends Position2D

export(Color) var bad_colour
export(Color) var good_colour

var points
var max_points

func _ready():
	var label = get_node("Score")
	var tween = get_node("Tween")
	label.text = str(int(points))
	
	var percentage = (points / max_points) * 100
	if (percentage < 10):
		label.add_color_override("font_color", bad_colour)
	else:
		label.add_color_override("font_color", good_colour)
	
	tween.interpolate_property(self, 'scale', scale, Vector2(1, 1), 0.1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.interpolate_property(self, 'scale', Vector2(1, 1), Vector2(0.1, 0.1), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT, 1)
	tween.start()
	yield(tween, "tween_all_completed")
	queue_free()
