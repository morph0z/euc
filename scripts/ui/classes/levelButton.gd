extends Button
class_name levelButton

var level:PackedScene

func _ready() -> void:
	connect("pressed", _on_pressed)
	
func _on_pressed() -> void:
	SceneManager.change_scene(level)
