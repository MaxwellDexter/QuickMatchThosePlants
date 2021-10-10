extends Spatial

var X_MOUSE_SENSITIVITY = 0.001
var Y_MOUSE_SENSITIVITY = 0.001
var INVERT_X = true
var INVERT_Y = true

var rot_x = 0
var rot_y = 0

var camera

func _ready():
	camera = $Camera
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	process_input(delta)

func process_input(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# do variable calculations
		var x_sens = X_MOUSE_SENSITIVITY * (-1 if INVERT_X else 1)
		print(x_sens)
		var y_sens = Y_MOUSE_SENSITIVITY * (-1 if INVERT_Y else 1)
		
		# modify accumulated mouse rotation
		rot_x += event.relative.x * x_sens
		rot_y += event.relative.y * y_sens
		
		# clamp vertical
		print(rot_y)
		rot_y = clamp(rot_y, -1, 1)

		# reset rotation
		transform.basis = Basis()
		camera.transform.basis = Basis()
		
		# rotate
		self.rotate_object_local(Vector3(0, 1, 0), rot_x)
		camera.rotate_object_local(Vector3(1, 0 , 0), rot_y)
