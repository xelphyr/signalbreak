@abstract
extends GraphNode
class_name Module

func _process(_delta : float) -> void:
	position_offset.x = clampf(position_offset.x, 0.0, $"..".size.x - size.x)
	position_offset.y = clampf(position_offset.y, 0.0, $"..".size.y - size.y)
	
	
