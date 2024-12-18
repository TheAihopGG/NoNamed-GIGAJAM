extends CharacterBody2D
class_name Entity

@export var hp: int
@export var max_hp: int
@export var speed_acceleration: float
@export var max_speed: float

@onready var hp_label: Label = $XP

var move_direction: Vector2

signal hp_reduced(new_hp: int)

func _set_hp_label() -> void:
	hp_label.text = str(hp) + "/" + str(max_hp)


func _reduce_hp(hp_count: int) -> void:
	hp += hp_count
	hp_reduced.emit(hp)
