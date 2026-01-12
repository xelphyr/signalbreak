extends GraphEdit
class_name Terminal



#region Module Handling
func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	connect_node(from_node, from_port, to_node, to_port, true)
#endregion

#region Misc
func _ready() -> void:
	scroll_offset = Vector2.ZERO

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask & MOUSE_BUTTON_MASK_MIDDLE:
			accept_event()
		if event.button_mask & MOUSE_BUTTON_MASK_RIGHT:
			accept_event()
#endregion
