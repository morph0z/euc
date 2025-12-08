extends state

@onready var playerRef:playerClass = machine.playerRefrence

func state_process() -> void:
	playerRef.sprite.play(playerRef.fallingAnimationName)
	
func state_ready() -> void:
	pass
	
func state_changed() -> void:
	pass

func _on_state_machine_changed_state() -> void:
	if machine.current_state != self:
		_state_changed()
