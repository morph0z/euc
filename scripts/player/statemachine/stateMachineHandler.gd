extends Node
class_name stateMachineHandler

@export var player_refrence_3D: playerClass3D
@export var player_refrence_2D: playerClass2D
@export var state_machine_refrence: stateMachine
@export var input_handler_refrence: inputHandler

func _air_states(player:Node) -> void:
	assert(!((player is playerClass2D) and (player is playerClass3D)), "Can only be a player type!")
	if input_handler_refrence.direction:
		state_machine_refrence.set_current_state(player.air_movement_state)
	if !input_handler_refrence.direction:
		state_machine_refrence.set_current_state(player.falling_state)

func _ground_states(player:Node) -> void:
	assert(!((player is playerClass2D) and (player is playerClass3D)), "Can only be a player type!")
	if input_handler_refrence.direction:
		state_machine_refrence.set_current_state(player.walking_state)
	if !input_handler_refrence.direction:
		state_machine_refrence.set_current_state(player.idle_state)

#region 3D Player State Changes
func _on_player_3d_got_off_ground(_remove_point: Vector3) -> void:
	_air_states(player_refrence_3D)

func _on_player_3d_touched_ground(_touch_point: Vector3) -> void:
	_ground_states(player_refrence_3D)
#endregion

#region 2D Player State Changes
func _on_player_2d_got_off_ground(_remove_point: Vector2) -> void:
	_air_states(player_refrence_2D)

func _on_player_2d_touched_ground(_touch_point: Vector2) -> void:
	_ground_states(player_refrence_2D)
#endregion
