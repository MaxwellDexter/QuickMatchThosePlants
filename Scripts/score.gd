extends Label

var floating_text = preload("res://Scenes/FloatingText.tscn")

func _ready():
	print(get_tree().get_root())
	var level_manager = get_tree().get_root().get_node("Game/Level Manager")
	level_manager.connect("score_changed", self, "score_changed")
	level_manager.connect("points_added", self, "points_added")

func score_changed(new_score):
	text = str(int(new_score))

func points_added(points, max_points):
	var text = floating_text.instance()
	text.points = points
	text.max_points = max_points
	text.position.y += rect_size.y
	text.position.x += 10
	add_child(text)
