extends Control

onready var timer = get_node("Timer")

onready var seconds_label = get_node("Colon/Seconds")
onready var milliseconds_label = get_node("Colon/Milliseconds")

func _process(delta):
	var elapsed = timer.get_time_left()
	var secs = floor(elapsed)
	var msecs = clamp(floor(stepify(elapsed - secs, 0.01) * 10), 0, 9)
	print("-------")
	print(elapsed)
	print(secs)
	print(msecs)
	seconds_label.text = str(secs)
	milliseconds_label.text = str(msecs)
