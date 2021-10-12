extends Node

export (Array, PackedScene) var plants
export (Array, Vector3) var pattern_positions
export (Array, Vector3) var puzzle_positions

var PLANT_COUNT = 5
var difficulty_level = 1

# these are the index in the plants array
var state_pattern:Array
var state_puzzle:Array

# this is for holding the plants
var puzzle_plant_objs:Array

var pattern_holder
var puzzle_holder

func _ready():
	pattern_holder = $PatternHolder
	puzzle_holder = $PuzzleHolder
	randomize()
	generate_room()

func get_next_plant_index(index):
	if index + 1 >= plants.size():
		index = 0
	else: index += 1
	return index

func get_next_plant_obj(index):
	return plants[index].instance()

func check_state():
	var solved = true
	for i in range(state_pattern.size()):
		solved &= state_pattern[i] == state_puzzle[i]
	return solved

func cycle_plant(index):
	var old_plant = puzzle_plant_objs[index]
	var pos = old_plant.transform
	old_plant.queue_free()
	
	var plant_idx = get_next_plant_index(state_puzzle[index])
	var new_plant = get_next_plant_obj(plant_idx)
	puzzle_holder.add_child(new_plant)
	new_plant.transform = pos
	puzzle_plant_objs[index] = new_plant

########################
# GENERATING ROOM CODE #
########################
func generate_room():
	print("generating room")
	set_up_pattern()
	set_up_puzzle()
	
	instantiate_plants(state_pattern, pattern_positions, pattern_holder)
	instantiate_plants(state_puzzle, puzzle_positions, puzzle_holder)
	
	print("-_-_-_-_-_-_-_-")

func set_up_pattern():
	state_pattern.resize(PLANT_COUNT)
	for i in range(PLANT_COUNT):
		var idx = randi() % plants.size()
		print(idx)
		state_pattern[i] = idx
	state_puzzle = state_pattern.duplicate()

func set_up_puzzle():
	var used_idxs = []
	for i in range(difficulty_level):
		var okay_idxs = []
		for j in range(PLANT_COUNT):
			if not j in used_idxs:
				okay_idxs.append(j)
		# pick a random index not in the used indexes
		var idx = okay_idxs[randi() % okay_idxs.size()]
		# assign a random value to it
		state_puzzle[idx] = randi() % plants.size()
		used_idxs.append(idx)

func instantiate_plants(state_array, positions, holder):
	print("-----")
	for i in range(state_array.size()):
		var idx = state_array[i]
		print(idx)
		var plant = plants[idx].instance()
		plant.translation = positions[i]
#		plant.rotation_degrees.y = randi() % 360
		puzzle_holder.add_child(plant)
