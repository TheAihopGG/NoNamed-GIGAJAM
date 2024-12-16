extends "res://scenes/objects/entity/Entity.gd"

@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite

var movement_enabled = true
var actions_enabled = true

func _physics_process(_delta: float) -> void:
	if movement_enabled:
		movement()
	if actions_enabled:
		actions()

func movement() -> void:
	if Input.is_action_pressed("moveForward"):
		velocity.y = -speed

	if Input.is_action_pressed("moveBackwards"):
		velocity.y = speed

	if Input.is_action_pressed("moveRight"):
		velocity.x = speed
	
	if Input.is_action_pressed("moveLeft"):
		velocity.x = -speed

func actions() -> void:
	if Input.is_action_just_pressed("attack"):
		print(name, "is attacking")
	
	elif Input.is_action_just_pressed("parry"):
		print(name, "is parring")
	
	elif Input.is_action_pressed("interact"):
		print(name, "is interacting")
