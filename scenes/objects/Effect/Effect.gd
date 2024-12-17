extends Node
class_name Effect

@export var positive: bool
@export var duration: float
@export var effect_rate: int

@onready var timer: Timer = $Timer

var entity: Entity = get_parent().get_parent()

func _ready() -> void:
	timer.start()

	
func _apply_effect_action() -> void:
	pass


func _on_timer_timeout() -> void:
	entity.effects.remove_child(self)
