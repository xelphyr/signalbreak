@abstract
extends GraphNode
class_name Module

#region Variables
## The Terminal to which this module is connected. [br]
## [b][color=yellow]Warning:[/color][/b] value is only initialized after [method _ready].
var terminal : Terminal
#endregion

#region Terminal-called processes
## First part of the two-part signal propagation (see [method _commit]).
## Processes all the things in a node step-by-step - 
## - [method _inlet]
## - [method _core]
## - [method _outlet]
func _tick() -> void:
	_inlet() 
	_core()
	_outlet()

## Second part of the two-part signal propagation (see [method _tick]). 
## Moves data from the back buffer to the front buffer for each input port before the next tick.
@abstract
func _commit() -> void
#endregion

#region Tick-called processes
## Step 1/3 of [method _tick]. Unpackages inputs in the top buffer of all the input ports, if they exist.
@abstract
func _inlet() -> void

## Step 2/3 of [method _tick]. Does operations on data from step 1 into outputs.
@abstract
func _core() -> void 

## Step 3/3 of [method _tick]. Packages and ships outputs through the output ports, if they exist.
@abstract
func _outlet() -> void
#endregion

#region General Module Processes
func _ready() -> void:
	terminal = get_tree().get_first_node_in_group(&"Terminal")

func _process(_delta : float) -> void:
	#Clamps the movement of the modules to within the bounds of the terminal
	position_offset.x = clampf(position_offset.x, 0.0, $"..".size.x - size.x) 
	position_offset.y = clampf(position_offset.y, 0.0, $"..".size.y - size.y) 
#endregion
