extends Control
class_name levelSelect

@export var line:Line2D
@export var levels:Array[PackedScene]
@export var points:Array[Marker2D]

func _ready() -> void:
	for i in range(0, levels.size()):
		_place_level_point_on_point(points[i], i)


func _place_level_point_on_point(point:Marker2D, number:int) -> void:
	for i in levels:
		var _level_button:levelButton = levelButton.new()
		_level_button.position = point.position
		_level_button.level = i
		_level_button.text = "Level : " + str(number)
		_level_button.theme = GlobalScript.GlobalTheme
		add_child(_level_button)
	
