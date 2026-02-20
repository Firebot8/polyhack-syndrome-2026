extends CharacterBody2D

# Movement speed
@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	# Get input direction
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Set velocity based on input
	velocity = direction * speed
	
	# Move the character
	move_and_slide()
