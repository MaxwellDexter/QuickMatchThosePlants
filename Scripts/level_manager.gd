extends Node

var room_scene = preload("res://Scenes/Room Manager.tscn")
var room_inst
var score = 0

func _ready():
	load_room()

func load_room():
	room_inst = room_scene.instance()
	add_child(room_inst)

func next_room(correct):
	if correct: score += 1
	remove_child(room_inst)
	room_inst.queue_free()
	load_room()
