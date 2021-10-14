extends Node

var room_scene = preload("res://Scenes/Room Manager.tscn")
var room_inst
var score = 0
var level_time = 0

const MIN_LEVEL_TIME = 20
const MAX_LEVEL_SCORE = 1000
const MIN_LEVEL_SCORE = 50

func _ready():
	load_room()

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
	if correct:
		if level_time > MIN_LEVEL_TIME:
			score += MIN_LEVEL_SCORE
		else:
			score += MAX_LEVEL_SCORE * (1 - (level_time / MIN_LEVEL_TIME))
	else:
		score += MIN_LEVEL_SCORE
	# tell ui to add score

func _process(delta):
	level_time += delta

func reset_time():
	level_time = 0

func get_time():
	return level_time

func _on_Timer_timeout():
	print("times up!")
	print(score)
