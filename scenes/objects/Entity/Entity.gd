extends CharacterBody2D
class_name Entity

const FRICTION = 0.15

@export var hp: int
@export var max_hp: int
@export var speed_acceleration: float
@export var max_speed: float

@onready var hp_label: Label = $XP
@onready var effects: Node = $Effects

enum states {
	MOVE,
	IDLE
}

var state: int
var move_direction: Vector2 = Vector2.ZERO

signal hp_reduced(new_hp: int)


func _physics_process(_delta: float) -> void:
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)


func _process(_delta: float) -> void:
	hp_label.text = str(hp) + "/" + str(max_hp)
	enter_state()
	if velocity.length() > max_speed:
		velocity = move_direction.normalized() * max_speed

	else:
		velocity += move_direction.normalized() * speed_acceleration
	move_and_slide()


func enter_state() -> void:
	pass


func _reduce_hp(hp_count: int) -> void:
	hp += hp_count
	hp_reduced.emit(hp)
