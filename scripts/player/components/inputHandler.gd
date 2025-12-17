extends component
class_name inputHandler

@export var _player_ref:playerClass3D
@export var _player_ref_2d:playerClass2D
@export var directional_inputs:bool = true

signal key_press(key_pressed:InputEvent)

var direction

var _change_state_once:bool = false
func _input(event: InputEvent) -> void:
	if directional_inputs:
		if _player_ref and !_player_ref_2d:
			var input_dir := Input.get_vector("Left", "Right", "Forward", "Backward")
			direction = (_player_ref.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

		if _player_ref_2d and !_player_ref:
			var input_dir := Input.get_axis("Left","Right")
			direction = input_dir
			
		if direction:
			if !_change_state_once:
				_change_state_once = true
		else:
			if _change_state_once:
				_change_state_once = false
	key_press.emit(event)
