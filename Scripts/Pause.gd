extends Control

var level_manager

func _ready():
	level_manager = get_tree().get_root().get_node("Game/Level Manager")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func _on_Button_pressed():
	toggle_pause()

func toggle_pause():
	if not level_manager.can_pause:
		return
	
	var is_now_paused = not get_tree().paused
	get_tree().paused = is_now_paused
	visible = is_now_paused
	if is_now_paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
