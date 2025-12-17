extends Node
class_name state

@export var machine:stateMachine

@export_group("State Info")
@export var state_name:StringName = &""

@warning_ignore("unused_private_class_variable")
var _call_state_changed_once:bool = false

func _state_process(_delta:float) -> void:
	assert(false, "This class is abstract")
	
func _state_ready() -> void:
	assert(false, "This class is abstract")
	
func _state_changed() -> void:
	assert(false, "This class is abstract")
	
#var _checked_current_state_changed:bool = false
var _checked_current_state_ready:bool = false
func _process(delta: float) -> void:
	if machine.current_state == self:
		_state_process(delta)
	
	if !_checked_current_state_ready:
		if machine.current_state == self:
			_state_ready()
			_checked_current_state_ready = true

func _on_state_machine_changed_state() -> void:
	if machine.current_state != self:
		if !_call_state_changed_once:
			_state_changed()
			_call_state_changed_once = true
			machine._state_ready_once = false
