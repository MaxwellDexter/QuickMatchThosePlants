extends Node

func _ready():
	get_tree().get_root().get_node("Game/Level Manager").connect("points_added", self, "points_added")

func points_added(points, max_points):
	var percentage = points / max_points
	if percentage < 0.05:
		$Vox/Wow.play_next()
	elif percentage < 0.5:
		$"Vox/Great Job".play_next()
	elif percentage < 0.9:
		$Vox/Amazing.play_next()
	else:
		$Vox/Spectacular.play_next()
