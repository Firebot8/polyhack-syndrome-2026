extends CharacterBody2D

@export var speed = 300.0

func _physics_process(delta: float) -> void:
	# Get input direction
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):  # D key
		direction.x += 1
	if Input.is_action_pressed("ui_left"):   # A key
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):   # S key
		direction.y += 1
	if Input.is_action_pressed("ui_up"):     # W key
		direction.y -= 1
	
	# Normalize to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	
	# Set velocity and move
	velocity = direction * speed
	move_and_slide()
