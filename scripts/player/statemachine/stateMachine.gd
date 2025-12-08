extends Node
class_name stateMachine

@export var playerRefrence:playerClass
@export var states_in_machine:Array[state]

var current_state:state

signal changedState

func set_current_state(new_state:state) -> void:
	current_state = new_state
	new_state.state_ready()
	changedState.emit()

func get_current_state() -> state:
	return current_state
