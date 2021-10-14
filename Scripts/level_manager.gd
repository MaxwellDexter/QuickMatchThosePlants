extends Node

signal score_changed(new_score)
signal points_added(points, max_points)

var room_scene = preload("res://Scenes/Room Manager.tscn")
var end_screen
var can_pause = true
var room_inst
var score = 0
var level_time = 0

const MIN_LEVEL_TIME = 20
const MAX_LEVEL_SCORE = 1000
const MIN_LEVEL_SCORE = 1

func _ready():
	load_room()
	end_screen = get_tree().get_root().get_node("Game/Pause/End Screen")

func load_room():
	room_inst = room_scene.instance()
	add_child(room_inst)
	reset_time()

func next_room(correct):
	add_score(correct)
	remove_child(room_inst)
	room_inst.queue_free()
	load_room()

func add_score(correct):
	var score_to_add = MIN_LEVEL_SCORE
	if correct and level_time <= MIN_LEVEL_TIME:
		score_to_add = MAX_LEVEL_SCORE * (1 - (level_time / MIN_LEVEL_TIME))
	score += score_to_add
	emit_signal("score_changed", score)
	emit_signal("points_added", score_to_add, MAX_LEVEL_SCORE)

func _process(delta):
	level_time += delta

func reset_time():
	level_time = 0

func get_time():
	return level_time

func _on_Timer_timeout():
	can_pause = false
	get_tree().paused = true
	end_screen.visible = true
	ScoreStorer.add_score(score)
	
