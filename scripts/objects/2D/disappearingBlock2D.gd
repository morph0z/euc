extends StaticBody2D
class_name disappearingBlock2D

##Makes the block disappear every n beats
@export var disappear_every:int = 1
@export var inverse_disappearance:bool 
@export var shader_material:ShaderMaterial
@export var color:Color
@export var material_overlay:Material

@onready var _conducted_timer: ConductedTimer = $ConductedTimer
@onready var _polygon: Polygon2D = $Polygon2D
@onready var _collision_shape: CollisionShape2D = $CollisionShape2D
@onready var _disappear_particles: CPUParticles2D = $disappearParticles
@onready var _disappear_poof: CPUParticles2D = $disappearPoof

func _ready() -> void:
	_conducted_timer.wait_beats = disappear_every
	_polygon.material = shader_material
	_polygon.color = color
	if material_overlay: _polygon.material_overlay = material_overlay
	_disappear_particles.color = color
	_disappear_poof.color = color
	_disappear_particles.emitting = false

func disappear() -> void:
	_polygon.hide()
	_disappear_poof.emitting = true
	_collision_shape.disabled = true
	_disappear_particles.emitting = true

func reappear() -> void:
	_polygon.show()
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
