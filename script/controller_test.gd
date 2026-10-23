
extends Node

func _ready() -> void:
	Input.joy_connection_changed.connect(_on_joy_connection_changed)
	print("Controller input detector started!")

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton:
		if event.pressed:
			print("BUTTON PRESSED: ", event.button_index)
		else:
			print("BUTTON RELEASED: ", event.button_index)

	elif event is InputEventJoypadMotion:
		print(
			"AXIS MOVED: ",
			event.axis,
			" | VALUE: ",
			event.axis_value
		)

	elif event is InputEventKey:
		if event.pressed and not event.echo:
			print("KEY PRESSED: ", event.as_text())

func _on_joy_connection_changed(
		device: int,
		connected: bool
) -> void:
	if connected:
		print("CONTROLLER CONNECTED: ", device)
	else:
		print("CONTROLLER DISCONNECTED: ", device)
