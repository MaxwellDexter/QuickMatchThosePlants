extends Node

var scores = []
var most_recent_score = 0

func add_score(score):
	most_recent_score = score
	scores.append(score)

func get_high_scores():
	var dupe = scores.duplicate()
	dupe.sort_custom(MyCustomSorter, "sort_desc")
	return dupe

class MyCustomSorter:
	static func sort_desc(a, b):
		return a > b
