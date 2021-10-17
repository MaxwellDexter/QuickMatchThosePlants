extends Control

var x_slider
var y_slider
var x_box
var y_box
var sfx_box
var music_box

const SFX_BUS_NO = 1
const MUSIC_BUS_NO = 2

func _ready():
	x_slider = $"VBoxContainer/X Sense/XsensSlider"
	x_slider.value = Settings.X_MOUSE_SENSITIVITY
	y_slider = $"VBoxContainer/Y Sense/YsensSlider"
	y_slider.value = Settings.Y_MOUSE_SENSITIVITY
	x_box = $"VBoxContainer/Invert X/InvertXBox"
	x_box.pressed = Settings.INVERT_X
	y_box = $"VBoxContainer/Invert Y/InvertYBox"
	y_box.pressed = Settings.INVERT_Y
	sfx_box = $VBoxContainer/SFX/SFXBox
	sfx_box.pressed = Settings.SFX
	music_box = $VBoxContainer/Music/MusicBox
	music_box.pressed = Settings.Music

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_XsensSlider_value_changed(value):
	Settings.X_MOUSE_SENSITIVITY = value

func _on_YsensSlider_value_changed(value):
	Settings.Y_MOUSE_SENSITIVITY = value

func _on_InvertXBox_toggled(button_pressed):
	Settings.INVERT_X = button_pressed

func _on_InvertYBox_toggled(button_pressed):
	Settings.INVERT_Y = button_pressed

func _on_SFXBox_toggled(button_pressed):
	Settings.SFX = button_pressed
	AudioServer.set_bus_mute(SFX_BUS_NO, not Settings.SFX)

func _on_MusicBox_toggled(button_pressed):
	Settings.Music = button_pressed
	AudioServer.set_bus_mute(MUSIC_BUS_NO, not Settings.Music)
	print(AudioServer.is_bus_mute(MUSIC_BUS_NO))


func _play_hover():
	pass # Replace with function body.
