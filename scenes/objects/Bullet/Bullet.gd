extends CharacterBody2D

@export var speed: float
@export var damage: int
@onready var weapon: StaticBody2D = get_parent()

func _ready() -> void:
	velocity.x = speed

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.reduce_xp(damage, weapon)
