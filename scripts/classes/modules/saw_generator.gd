extends Module
class_name SawGeneratorModule

var data : SignalSpec = SignalSpec.new()

func _commit() -> void:
	pass

func _inlet() -> void:
	pass

func _core() -> void :
	data.add_to_stack(Signals.SAW)

func _outlet() -> void:
	terminal.request_data_transfer(name, 0, data)
	
func receive_data(_data) -> void:
	pass
