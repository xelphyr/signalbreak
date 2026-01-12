extends GraphEdit
class_name Terminal

#region Variables
## Frequency of ticks per second.
@export var frequency : float = 30.0
## onready-calculated seconds per tick
@onready var spt : float = 1/frequency
## cooldown variable. Increments by [code]delta[/code] every frame, resets after it's greater than [member spt]
var cooldown : float = 0.0

#endregion

#region Signals
signal tick
signal post_tick
#endregion

#region Signal Propagation
func _process(delta: float) -> void:
	if cooldown > spt:
		cooldown -= spt
		tick.emit()
		post_tick.emit()
	cooldown += delta
#endregion

#region Module Handling
func _on_connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void:
	connect_node(from_node, from_port, to_node, to_port, true)
#endregion

#region Functions
func request_data_transfer(from_node: StringName, from_port: int, data):
	var output = get_node(get_connection_list_from_node(from_node)\
	.filter(func(connection): return connection["from_port"] == from_port)\
	[0])
	
	output.receive_data(data)
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
