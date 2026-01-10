extends Module
class_name TestModule

func _ready() -> void:
	var port : Control = Control.new()
	port.custom_minimum_size.y = 20
	call_deferred("add_child", port)
	call_deferred("_after_adding_port")
	
func _after_adding_port() -> void:
	set_slot(0, true, 0, Color.WHITE ,true, 0, Color.WHITE)
	
