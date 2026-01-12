extends Resource
class_name SignalSpec

var _data: Array = []

func add_to_stack(item):
	_data.append(item)
	
func get_data() -> Array:
	return _data
