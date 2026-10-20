extends CharacterBody2D

var jump_count = 0
var wall_count = 0
const SPEED = 300.0
const JUMP_VELOCITY = -850.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	#Animation
	if (velocity.x < -1 || velocity.x > 1):
		sprite_2d.animation = 'running'
	else:
		sprite_2d.animation = 'default'
	# Reset the jump count each time character is on the floor
	if is_on_floor():
		jump_count = 0
		wall_count = 0
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if not is_on_floor_only():
			sprite_2d.animation = 'jumping'
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif jump_count == 1:
			jump_count = 2
			velocity.y = .85 * JUMP_VELOCITY
			sprite_2d.animation = 'double_jump'

	if is_on_wall_only():
		sprite_2d.animation = 'wall_jump'
		if Input.is_action_just_pressed("jump") and wall_count == 0:
			velocity.y = JUMP_VELOCITY
			velocity.x = SPEED
			wall_count += 1

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 17)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	
