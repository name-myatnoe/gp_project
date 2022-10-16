extends actors

signal grounded_updated(is_ground)

export var stomp_impulse = 1000.0


func _on_enemyDetector_area_entered(_area):
	velocity = calculate_stomp_velocity(velocity,stomp_impulse)

func _on_enemyDetector_body_entered(_body):
	queue_free()

onready var bounce_raycasts=$BounceRaycasts


func _physics_process(_delta):

	var direction := get_direction()
	var is_jump_interrupted := Input.is_action_just_released("jump") and velocity.y < 0
	velocity = calculate_move_velocity(velocity,speed,direction,is_jump_interrupted)
	velocity = move_and_slide(velocity,normal_floor)
	
	var was_grounded=is_grounded
	is_grounded=is_on_floor()
	
	if was_grounded==null|| was_grounded!=is_grounded:
		emit_signal("grounded_updated",is_grounded)
	

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

func _apply_movement(delta):
	_check_bounce(delta)

func calculate_stomp_velocity(linear_velocity : Vector2,impulse : float) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.y = -impulse
	return new_velocity
	
func _check_bounce(delta):
	if velocity.y >0:
		for raycast in bounce_raycasts.get_children():
			raycast.cast_to=Vector2.DOWN * velocity * delta +Vector2.DOWN
			raycast.force_raycast_update()
			if raycast.is_colliding() && raycast.get_collision_normal()==Vector2.UP:
				velocity.y = (raycast.get_collision_point() -raycast.global_position -Vector2.DOWN).y
				raycast.get_collider().entity.call_deferred("be_bounced_upon",self)
				break


