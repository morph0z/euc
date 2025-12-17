extends Node3D
class_name dropShadowComponent

@export var _player_ref:playerClass3D

func _process(_delta: float) -> void:
	global_position.x = _player_ref.global_position.x
