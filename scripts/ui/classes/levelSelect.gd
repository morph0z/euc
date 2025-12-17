extends Control
class_name levelSelect

@export var line:Line2D
@export var levels:Array[PackedScene]
@export var points:Array[Marker2D]

func _ready() -> void:
	_place_level_point_on_point()


func _place_level_point_on_point() -> void:
	for i in range(0, levels.size()):
		var _level_button:levelButton = levelButton.new()
		_level_button.position = points[i].position
		_level_button.level = levels[i]
		_level_button.text = "Level : " + str(i)
		_level_button.theme = GlobalScript.GlobalTheme
		add_child(_level_button)
	
