extends Area2D
class_name deathZone2D

signal player_entered_death_zone

func _on_body_entered(body: Node2D) -> void:
	if body is playerClass2D:
		player_entered_death_zone.emit()
