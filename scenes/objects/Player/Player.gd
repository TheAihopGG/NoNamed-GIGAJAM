extends Entity

@onready var animation_tree: AnimationTree = $AnimationTree

var playback: AnimationNodeStateMachinePlayback


func _ready() -> void:
	playback = animation_tree["parameters/playback"]


func _physics_process(_delta: float) -> void:
	move_direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		move_direction += Vector2.UP
	
	if Input.is_action_pressed("down"):
		move_direction += Vector2.DOWN
	
	if Input.is_action_pressed("right"):
		move_direction += Vector2.RIGHT
	
	if Input.is_action_pressed("left"):
		move_direction += Vector2.LEFT

	velocity = move_direction.normalized() * speed_acceleration
	velocity.limit_length(max_speed)
	
	move_and_slide()
	select_animation()
	update_animation_parameters()


func select_animation() -> void:
	if velocity == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walk")


func update_animation_parameters() -> void:
	if move_direction != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = move_direction
		animation_tree["parameters/Walk/blend_position"] = move_direction
