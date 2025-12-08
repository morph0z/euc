extends component
class_name inputHandler

@export var player:playerClass
@export var directional_inputs:bool = true

signal key_press(key_pressed:InputEvent)

var direction:Vector3

var _change_state_once:bool = false
func _input(event: InputEvent) -> void:
	if directional_inputs:
		var input_dir := Input.get_vector("Left", "Right", "Forward", "Backward")
		direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			if !_change_state_once:
				_change_state_once = true
		if !direction:
			if _change_state_once:
				_change_state_once = false
	key_press.emit(event)
