extends state

@onready var _player_ref:playerClass = machine.player_refrence

func _state_process() -> void:
	_player_ref.sprite.play(_player_ref.walkingAnimationName)
	
func _state_ready() -> void:
	pass
	
func _state_changed() -> void:
	pass

func _on_state_machine_changed_state() -> void:
	if machine.current_state != self:
		_state_changed()
