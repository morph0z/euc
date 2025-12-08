extends CharacterBody3D
class_name playerClass

@export var player_state_machine: stateMachine
@export var debug: bool
@onready var idle_state: Node = $state_machine/Idle_State
@onready var walking_state: Node = $state_machine/Walking_State
@onready var air_movement_state: Node = $state_machine/Air_Movement_State
@onready var falling_state: Node = $stateMachine/Falling_State

@export_group("Visuals")
@export var sprite: AnimatedSprite3D

@export_subgroup("Animation Names")
@export var idleAnimationName: String = &""
@export var fallingAnimationName: String
@export var jumpAnimationName: String
@export var walkingAnimationName: String
@export var runningAnimationName: String

@export_group("Components")
@export var input_handler: inputHandler

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _initiate_components() -> void:
	pass

func _initiate_state_machine() -> void:
	player_state_machine.set_current_state(idle_state)

func _process(_delta: float) -> void:
	if debug:
		print(player_state_machine.get_current_state())

func _ready() -> void:
	_initiate_state_machine()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite.play(fallingAnimationName)
		
	var dir = input_handler.direction
	if dir:
		velocity.x = dir.x * SPEED
		velocity.z = dir.z * SPEED
		sprite_flip(dir)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func sprite_flip(direction:Vector3) -> void:
	if direction.x >= 0:
		sprite.flip_h = false
	if direction.x <= -0.5:
		sprite.flip_h = true

func _on_input_handler_key_press(key_pressed: InputEvent) -> void:
	if key_pressed.is_action_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
