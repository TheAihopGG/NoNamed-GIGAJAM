extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("planet_orbit")
	$AnimationPlayer2.play("planet_orbit_2")
