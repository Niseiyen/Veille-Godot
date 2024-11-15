extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -350.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		print("L'utilisateur a sauté")
	
	if Input.is_action_just_pressed("move_down") and is_on_floor():
		position.y += 1.5	
	
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			print("L'utilisateur se déplace vers la droite")
		elif direction < 0:
			print("L'utilisateur se déplace vers la gauche")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
