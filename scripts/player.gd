extends CharacterBody2D

@export var tile_size = 16
@export var speed = 100.0

var is_moving = false
var target_position = Vector2.ZERO
var next_direction = Vector2.ZERO

func _ready() -> void:
	# Snap to grid on start
	position = position.snapped(Vector2(tile_size, tile_size))
	target_position = position

func _physics_process(delta: float) -> void:
	# Get input direction
	if Input.is_action_pressed("ui_right"):
		next_direction = Vector2.RIGHT
	elif Input.is_action_pressed("ui_left"):
		next_direction = Vector2.LEFT
	elif Input.is_action_pressed("ui_down"):
		next_direction = Vector2.DOWN
	elif Input.is_action_pressed("ui_up"):
		next_direction = Vector2.UP
	
	# Start moving if not already moving
	if not is_moving and next_direction != Vector2.ZERO:
		target_position = position + next_direction * tile_size
		is_moving = true
	
	# Smooth movement to target
	if is_moving:
		var direction = (target_position - position).normalized()
		velocity = direction * speed
		move_and_slide()
		
		# Check if reached target
		if position.distance_to(target_position) < 2:
			position = target_position
			is_moving = false
