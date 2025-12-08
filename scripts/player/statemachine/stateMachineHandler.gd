extends Node
class_name stateMachineHandler

@export var player_refrence: playerClass
@export var state_machine_refrence: stateMachine
@export var input_handler_refrence: inputHandler

func _on_player_got_off_ground(_remove_point: Vector3) -> void:
	if !player_refrence.is_on_floor():
		if input_handler_refrence.direction:
			state_machine_refrence.set_current_state(player_refrence.air_movement_state)
		if !input_handler_refrence.direction:
			state_machine_refrence.set_current_state(player_refrence.falling_state)

func _on_player_touched_ground(_touch_point: Vector3) -> void:
	if input_handler_refrence.direction:
		state_machine_refrence.set_current_state(player_refrence.walking_state)
	if !input_handler_refrence.direction:
		state_machine_refrence.set_current_state(player_refrence.idle_state)
