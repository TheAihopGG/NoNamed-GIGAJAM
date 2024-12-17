extends Entity

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var last_direction: Vector2 = Vector2.RIGHT


func get_input() -> void:
	move_direction = Vector2.ZERO
	if Input.is_action_pressed("moveUp"):
		move_direction += Vector2.UP
	
	if Input.is_action_pressed("moveDown"):
		move_direction += Vector2.DOWN

	if Input.is_action_pressed("moveRight"):
		move_direction += Vector2.RIGHT
	
	if Input.is_action_pressed("moveLeft"):
		move_direction += Vector2.LEFT
	
	if move_direction != Vector2.ZERO:
		last_direction = move_direction.normalized()
		state = states.MOVE
	
	else:
		state = states.IDLE


func enter_state() -> void:
	match state:
		states.MOVE:
			match move_direction:
				Vector2(0, -1):
					animation_player.play("walk_up")
				
				Vector2(1, -1):
					animation_player.play("walk_right_up")

				Vector2(0, 1):
					animation_player.play("walk_down")
				
				Vector2(1, 0):
					animation_player.play("walk_right")
				
				Vector2(1, 1):
					animation_player.play("walk_right")
				
				Vector2(-1, 0):
					animation_player.play("walk_left")
				
				Vector2(-1, 1):
					animation_player.play("walk_left")
				
				Vector2(-1, -1):
					animation_player.play("walk_left_up")
			
		states.IDLE:
			match last_direction:
				Vector2(0, -1):
					animation_player.play("idle_up")
				
				Vector2(1, -1):
					animation_player.play("idle_right_up")

				Vector2(0, 1):
					animation_player.play("idle_down")
				
				Vector2(1, 1):
					animation_player.play("idle_down")
				
				Vector2(-1, 1):
					animation_player.play("idle_down")
				
				Vector2(1, 0):
					animation_player.play("idle_right")
	
				Vector2(-1, 0):
					animation_player.play("idle_left")

				Vector2(-1, -1):
					animation_player.play("idle_left_up")
