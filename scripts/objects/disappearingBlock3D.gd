extends StaticBody3D
class_name disappearingBlock3D

##Makes the block disappear every n beats
@export var disappear_every:int = 1
@export var inverse_disappearance:bool 
@export var material:Material
@export var material_overlay:Material

@onready var _conducted_timer: ConductedTimer = $ConductedTimer
@onready var _mesh: MeshInstance3D = $MeshInstance3D
@onready var _collision_shape: CollisionShape3D = $CollisionShape3D
@onready var _disappear_particles: CPUParticles3D = $disappearParticles
@onready var _disappear_poof: CPUParticles3D = $disappearPoof

func _ready() -> void:
	_conducted_timer.wait_beats = disappear_every
	_mesh.material_override = material
	_mesh.material_overlay = material_overlay
	_disappear_particles.emitting = false

func disappear() -> void:
	_mesh.hide()
	_disappear_poof.emitting = true
	_collision_shape.disabled = true
	_disappear_particles.emitting = true

func reappear() -> void:
	_mesh.show()
	_collision_shape.disabled = false
	_disappear_particles.emitting = false

var inc:int = 0
func _on_conducted_timer_timeout() -> void:
	inc += 1
	if !inverse_disappearance:
		if (inc % 2) == 0:
			disappear()
		elif (inc % 2) != 0:
			reappear()
	elif inverse_disappearance:
		if (inc % 2) != 0:
			disappear()
		elif (inc % 2) == 0:
			reappear()
