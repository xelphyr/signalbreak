extends Module
class_name TestModule

func _commit() -> void:
	print("Commit")

func _inlet() -> void:
	print("Inlet")

func _core() -> void:
	print("Core")

func _outlet() -> void:
	print("Outlet")
	
func receive_data(_data) -> void:
	pass
