extends Node
class_name state

@export var machine:stateMachine

@export_group("State Info")
@export var state_name:StringName = &""

func _state_process() -> void:
	assert(false, "This class is abstract")
	
func _state_ready() -> void:
	assert(false, "This class is abstract")
	
func _state_changed() -> void:
	assert(false, "This class is abstract")
	
#var _checked_current_state_changed:bool = false
var _checked_current_state_ready:bool = false
func _process(_delta: float) -> void:
	if machine.current_state == self:
		_state_process()
	
	if !_checked_current_state_ready:
		if machine.current_state == self:
			_state_ready()
		#_checked_current_state_changed = false
		_checked_current_state_ready = true
