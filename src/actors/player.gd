extends actors

export var stomp_impulse = 1000.0
export var bouncy=-2000
var coins=0
var direction 

func _on_enemyDetector_area_entered(_area):
	velocity = calculate_stomp_velocity(velocity,stomp_impulse)

func _on_enemyDetector_body_entered(_body):
	set_modulate(Color(1,0.3,0.3,0.3))
	Global.lose_life()
	$Timer.start()

func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))

func _on_Bouncy_body_entered(_body):
	velocity.y=bouncy
	$Eaint.play("jump")
	$Ladia.play("L_jump")
	

func _on_fallzone_body_entered(_body):
	Global.lose_life()
	if Global.lives>=1:
		position.x=132
		position.y=466



func _physics_process(_delta):
	if .is_on_floor():
		$Eaint.play("Walk")
		$Ladia.play("L_walk")
	else:
		$Eaint.play("jump")
		$Ladia.play("L_jump")
		$jump.play()
	
	direction=get_direction()
	var is_jump_interrupted := Input.is_action_just_released("jump") and velocity.y < 0
	velocity = calculate_move_velocity(velocity,speed,direction,is_jump_interrupted)
	velocity = move_and_slide(velocity,normal_floor)
	
	
		
	
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

func calculate_stomp_velocity(linear_velocity : Vector2,impulse : float) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.y = -impulse
	return new_velocity
 
func add_coins():
	coins+=1
