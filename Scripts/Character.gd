extends Spatial

signal clicked_object(object)

var X_MOUSE_SENSITIVITY = 0.001
var Y_MOUSE_SENSITIVITY = 0.001
var INVERT_X = true
var INVERT_Y = true

var rot_x = 0
var rot_y = 0

var rotator

func _ready():
	rotator = $Rotation
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		rot_x += PI
		rotate_self()

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		# do variable calculations
		var x_sens = X_MOUSE_SENSITIVITY * (-1 if INVERT_X else 1)
		var y_sens = Y_MOUSE_SENSITIVITY * (-1 if INVERT_Y else 1)
		
		# modify accumulated mouse rotation
		rot_x += event.relative.x * x_sens
		rot_y += event.relative.y * y_sens
		
		# clamp vertical
		rot_y = clamp(rot_y, -1, 1)
		
		rotate_self()

func rotate_self():
	# reset rotation
	rotator.transform.basis = Basis()
	
	# rotate
	rotator.rotate_object_local(Vector3(0, 1, 0), rot_x)
	rotator.rotate_object_local(Vector3(1, 0 , 0), rot_y)

func _on_RayCast_clicked_object(object):
	emit_signal("clicked_object", object)
