extends Control

var score_label = preload("res://Scenes/High Score.tscn")

onready var exclamation = get_node("Exclamation")
onready var score = get_node("Score")
onready var container = get_node("High Score Container")

const SHOWN_HIGH_SCORES = 4

func _ready():
	score.text = str(int(ScoreStorer.most_recent_score))
	var high_scores = ScoreStorer.get_high_scores()
	if high_scores.size() > 0:
		var length = SHOWN_HIGH_SCORES
		if high_scores.size() < length:
			length = high_scores.size()
		for i in range(length):
			var label = score_label.instance()
			label.text = str(int(high_scores[i]))
			container.add_child(label)

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
