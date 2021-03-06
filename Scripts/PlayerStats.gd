extends Node


export(int) var max_health = 6 setget set_max_health
onready var health = max_health setget set_health

signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(6, max_health)
	emit_signal("max_health_changed", max_health)

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		get_tree().change_scene("res://Scenes/GameOverScreen.tscn")


func _ready():
	self.health = max_health
