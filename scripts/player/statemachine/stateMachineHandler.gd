extends Node
class_name stateMachineHandler

@export var player_refrence: playerClass
@export var state_machine_refrence: stateMachine
@export var input_handler_refrence: inputHandler

func _process(delta: float) -> void:
	if player_refrence.is_on_floor():
		if input_handler_refrence.direction:
			state_machine_refrence.set_current_state(player_refrence.walking_state)
		if !input_handler_refrence.direction:
			state_machine_refrence.set_current_state(player_refrence.idle_state)
			
	if !player_refrence.is_on_floor():
		if input_handler_refrence.direction:
			state_machine_refrence.set_current_state(player_refrence.air_movement_state)
		if !input_handler_refrence.direction:
			state_machine_refrence.set_current_state(player_refrence.falling_state)
		
