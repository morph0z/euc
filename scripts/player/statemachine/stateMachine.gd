extends Node
class_name stateMachine

@export var player_refrence_3D:playerClass3D
@export var player_refrence_2D:playerClass2D

@export var states_in_machine:Array[state]

var current_state:state

signal changed_state

var _state_ready_once:bool = false
func set_current_state(new_state:state) -> void:
	current_state = new_state
	changed_state.emit()
	if !_state_ready_once:
		new_state._state_ready()
		_state_ready_once = true

func get_current_state() -> state:
	return current_state
