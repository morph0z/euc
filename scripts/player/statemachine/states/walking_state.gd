extends state

@onready var _player_ref_3D:playerClass3D = machine.player_refrence_3D
@onready var _player_ref_2D:playerClass2D = machine.player_refrence_2D

func _state_process(_delta:float) -> void:
	if _player_ref_3D:
		_player_ref_3D.sprite.play(_player_ref_3D.walkingAnimationName)
	if _player_ref_2D:
		_player_ref_2D.sprite.play(_player_ref_2D.walkingAnimationName)

	
func _state_ready() -> void:
	_call_state_changed_once = false
	
func _state_changed() -> void:
	pass
