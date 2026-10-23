@export var controller_sensitivity: float = 2.5
@export var controller_deadzone: float = 0.18

@onready var head: Node3D = $Head

func _process(delta: float) -> void:
	var look_x: float = Input.get_joy_axis(
		0, JOY_AXIS_RIGHT_X
	)
	var look_y: float = Input.get_joy_axis(
		0, JOY_AXIS_RIGHT_Y
	)

	if abs(look_x) > controller_deadzone:
		rotate_y(-look_x * controller_sensitivity * delta)

	if abs(look_y) > controller_deadzone:
		head.rotation.x -= (
			look_y * controller_sensitivity * delta
		)
		head.rotation.x = clamp(
			head.rotation.x,
			deg_to_rad(-85),
			deg_to_rad(85)
		)
