extends "res://scenes/objects/weapon/Weapon.gd"

@export var reload_time: float
@export var bullets_count: int
@export var bullet: PackedScene

func _shoot() -> void:
	add_child(bullet.get_local_scene())
    print("Shoot")
