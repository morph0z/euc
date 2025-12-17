extends state

@onready var _player_ref:playerClass = machine.player_refrence

func _state_process(delta:float) -> void:
	pass
	
func _state_ready() -> void:
	_call_state_changed_once = false

	
func _state_changed() -> void:
	pass
