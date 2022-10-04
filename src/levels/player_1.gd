extends action

onready var active_manager= get_parent()

func _physics_process(delta):
	var is_active = active_manager.active
	
	if is_active ==1:
		var direction := get_direction()
		var is_jump_interrupted := Input.is_action_just_released("jump") and velocity.y < 0
		velocity = calculate_move_velocity(velocity,speed,direction,is_jump_interrupted)
		velocity = move_and_slide(velocity,normal_floor)
	else :
		var temp= 2
	pass
	
func _ready():
	pass

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1 if Input.is_action_just_pressed("jump") and is_on_floor() else 1
	)

func calculate_move_velocity(
	linear_velocity : Vector2,
	speed : Vector2,
	direction : Vector2,
	is_jump_interrupted : bool
	) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1:
		new_velocity.y = speed.y * direction.y 
	if is_jump_interrupted:
		new_velocity.y = 0
	return new_velocity


