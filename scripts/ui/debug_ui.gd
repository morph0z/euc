extends Control
@onready var fps: Label = $FPS
@onready var current_state: Label = $currentState
@export var _player_ref:playerClass3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	fps.text = str(Performance.get_monitor(Performance.TIME_FPS))
	current_state.text = str(_player_ref.player_state_machine.current_state)
