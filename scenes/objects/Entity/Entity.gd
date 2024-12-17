extends CharacterBody2D
class_name Entity

const FRICTION = 0.15

@export var hp: int
@export var max_hp: int
@export var speed_acceleration: float
@export var max_speed: float

@onready var hp_label: Label = $XP

enum states {
	MOVE,
	IDLE
}

var state: int
var move_direction: Vector2 = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)


func _process(_delta: float) -> void:
	hp_label.text = str(hp) + "/" + str(max_hp)
	get_input()
	enter_state()
	if velocity.length() > max_speed:
		velocity = move_direction.normalized() * max_speed

	else:
		velocity += move_direction.normalized() * speed_acceleration
	move_and_slide()


func get_input() -> void:
	pass


func enter_state() -> void:
	match state:
		states.MOVE:
			print(move_direction)
		
		states.IDLE:
			print(move_direction)
