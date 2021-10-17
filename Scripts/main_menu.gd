extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_Score_pressed():
	get_tree().change_scene("res://Scenes/ScoreScreen.tscn")

func _on_Settings_pressed():
	get_tree().change_scene("res://Scenes/Settings.tscn")

func _on_Quit_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	get_tree().change_scene("res://Scenes/CreditsScreen.tscn")

func _on_How_To_Play_pressed():
	get_tree().change_scene("res://Scenes/HowToPlayScreen.tscn")
