extends state

@onready var _player_ref_3D:playerClass3D = machine.player_refrence_3D
@onready var _player_ref_2D:playerClass2D = machine.player_refrence_2D

func _state_process(_delta:float) -> void:
	if _player_ref_3D:
		_player_ref_3D.sprite.play(_player_ref_3D.fallingAnimationName)
	if _player_ref_2D:
		_player_ref_2D.sprite.play(_player_ref_2D.fallingAnimationName)
		
func _state_ready() -> void:
	_call_state_changed_once = false
	if _player_ref_3D:
		_player_ref_3D.squash_and_strech_component.stretch()
	if _player_ref_2D:
		_player_ref_2D.squash_and_strech_component.stretch()
	
func _state_changed() -> void:
	if _player_ref_3D:
		_player_ref_3D.squash_and_strech_component.squash()
	if _player_ref_2D:
		_player_ref_2D.squash_and_strech_component.squash()
