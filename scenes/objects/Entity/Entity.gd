extends CharacterBody2D

@export var xp: int
@export var speed: float

@onready var xp_label: Label = $XP
@onready var weapons: Array[Node] = $Weapons.get_children()

func _ready() -> void:
	for weapon in weapons:
		print(weapon.name)

func _process(_delta: float) -> void:
	xp_label.text = str(xp)

func _replenish_xp(
	count: int
) -> void:
	xp += count
	print(name, "replenished xp", count)

func _take_damage(
	damage: int,
	_weapon: String
) -> void:
	xp -= damage
	print(name, "took damage", damage)
