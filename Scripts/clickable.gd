extends Node

export(String) var identifier
export(bool) var is_clickable = false

onready var shader = get_parent().get_active_material(0).next_pass

var targeted = false setget set_targeted

func set_targeted(value):
	targeted = value
	if is_clickable and targeted:
		shader.set_shader_param("strength", 0.2)
	else:
		shader.set_shader_param("strength", 0.0)
