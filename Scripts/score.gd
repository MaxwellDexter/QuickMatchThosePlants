extends Label

func _ready():
	print(get_tree().get_root())
	var level_manager = get_tree().get_root().get_node("Game/Level Manager")
	level_manager.connect("score_changed", self, "score_changed")

func score_changed(new_score):
	text = str(int(new_score))
