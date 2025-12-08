extends state

@onready var playerRef:playerClass = machine.playerRefrence

func _state_process() -> void:
	playerRef.sprite.play(playerRef.walkingAnimationName)
	
func _state_ready() -> void:
	pass
	
func _state_changed() -> void:
	pass

func _on_state_machine_changed_state() -> void:
	if machine.current_state != self:
		_state_changed()
