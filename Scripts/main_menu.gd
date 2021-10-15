extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_Score_pressed():
	get_tree().change_scene("res://Scenes/High Score.tscn")

func _on_Settings_pressed():
	pass # TODO

func _on_Quit_pressed():
	get_tree().quit()
