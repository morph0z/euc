extends CharacterBody3D
class_name playerClass3D

@export var player_state_machine: stateMachine
@export var debug: bool
@onready var idle_state: state = $stateMachine/Idle_State
@onready var walking_state: state = $stateMachine/Walking_State
@onready var air_movement_state: state = $stateMachine/Air_Movement_State
@onready var falling_state: state = $stateMachine/Falling_State

@export_group("Visuals")
@export var sprite: AnimatedSprite3D

@export_subgroup("Animation Names")
@export var idleAnimationName: String
@export var fallingAnimationName: String
@export var jumpAnimationName: String
@export var walkingAnimationName: String
@export var runningAnimationName: String

@export_group("Components")
@export var input_handler: inputHandler
@export var squash_and_strech_component: squashAndStrechComponent
@export var animation_component: AnimationPlayer

signal touched_ground(touch_point:Vector3)
signal got_off_ground(remove_point:Vector3)

@export var  SPEED:float = 5.0
@export var  JUMP_VELOCITY:float = 4.5

const MINECRAFT___AMOS_RODDY___TEARS = preload("res://assets/music/Minecraft & Amos Roddy - Tears.mp3")

func _initiate_components() -> void:
	pass

func _initiate_state_machine() -> void:
	pass
	#player_state_machine.set_current_state(idle_state)

func _process(_delta: float) -> void:
	if debug:
		print(str(player_state_machine.get_current_state())+" :Current State")

func _initiate_conductor() -> void:
	Conductor.set_song(MINECRAFT___AMOS_RODDY___TEARS, 99)
	Conductor.play()

func _ready() -> void:
	_initiate_state_machine()
	_initiate_conductor()

var _emited_touch_floor_signal:bool = false
var _emited_off_floor_signal:bool = false
func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	sprite_flip_verticaly()
	
#region Ground Signals
	if _emited_touch_floor_signal == false:
		if is_on_floor():
			touched_ground.emit(position)
		_emited_touch_floor_signal = true
		_emited_off_floor_signal = false
	
	if _emited_off_floor_signal == false:
		if !is_on_floor():
			got_off_ground.emit(position)
		_emited_touch_floor_signal = false
		_emited_off_floor_signal = true
#endregion
	
	var dir = input_handler.direction
	if dir:
		velocity.x = dir.x * SPEED
		velocity.z = dir.z * SPEED
		sprite_flip_horizontaly(dir)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func sprite_flip_horizontaly(direction:Vector3) -> void:
	if direction.x >= 0:
		sprite.flip_h = false
	if direction.x <= -0.5:
		sprite.flip_h = true

func sprite_flip_verticaly() -> void:
	if get_gravity() >= Vector3.ZERO:
		sprite.flip_v = true
	if get_gravity() <= Vector3.ZERO:
		sprite.flip_v = false

func _on_input_handler_key_press(key_pressed: InputEvent) -> void:
	if key_pressed.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


func _on_conducted_timer_timeout() -> void:
	squash_and_strech_component.squash()
