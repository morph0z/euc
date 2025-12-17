extends Area3D
class_name gravityPulse3D

##Makes the block disappear every n beats
@export var disappear_every:int = 1
@export var inverse_gravity_pulse_timing: bool = false
@export var inverse_gravity: bool = false

@onready var _pulse_particles: CPUParticles3D = $pulseParticles
@onready var conducted_timer: ConductedTimer = $ConductedTimer

var _can_effect_player_with_gravity:bool = false

func _ready() -> void:
	_pulse_particles.emitting = false
	conducted_timer.wait_beats = disappear_every
	if inverse_gravity:
		_pulse_particles.gravity = _pulse_particles.gravity * -1

func gravity_particles(toggle:bool) -> void:
	_pulse_particles.emitting = toggle

func gravity_pulse_increase() -> void:
	if !inverse_gravity:
		PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY, 9.8 * 4)
	if inverse_gravity:
		PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY, 9.8 * -2)

func gravity_pulse_decrease() -> void:
	PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY, 9.8 )

var inc: int = 0
func _on_conducted_timer_timeout() -> void:
	inc += 1
	if _can_effect_player_with_gravity:
		if !inverse_gravity_pulse_timing:
			if (inc % 2) == 0:
				gravity_pulse_increase()
			elif (inc % 2) != 0:
				gravity_pulse_decrease()
		elif inverse_gravity_pulse_timing:
			if (inc % 2) != 0:
				gravity_pulse_decrease()
			elif (inc % 2) == 0:
				gravity_pulse_increase()

	if !inverse_gravity_pulse_timing:
		if (inc % 2) == 0:
			gravity_particles(true)
		elif (inc % 2) != 0:
			gravity_particles(false)
	elif inverse_gravity_pulse_timing:
		if (inc % 2) != 0:
			gravity_particles(false)
		elif (inc % 2) == 0:
			gravity_particles(true)


func _on_body_entered(body: Node3D) -> void:
	if body is playerClass3D:
		_can_effect_player_with_gravity = true

func _on_body_exited(body: Node3D) -> void:
	if body is playerClass3D:
		_can_effect_player_with_gravity = false
		PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space, PhysicsServer3D.AREA_PARAM_GRAVITY, 9.8 )
