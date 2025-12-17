extends component
class_name squashAndStrechComponent

@export var _animation_player_ref:AnimationPlayer
@export var squash_animation:StringName
@export var strech_animation:StringName

func base():
	_animation_player_ref.play("base")

func squash():
	_animation_player_ref.play(squash_animation)

func stretch():
	_animation_player_ref.play(strech_animation)
