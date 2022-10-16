extends Camera2D

const look_ahead_factor=0.2
const shift_Trans=Tween.TRANS_SINE
const shift_ease=Tween.EASE_OUT
const shift_duration=1

var facing=0

onready var pre_camera_pos=get_camera_position()
onready var tween=$ShiftTween

func _process(_delta):
	_check_facing()
	pre_camera_pos=get_camera_position()

func _check_facing():
	var new_facing=sign(get_camera_position().x -pre_camera_pos.x)
	if new_facing!=0 && facing!=new_facing:
		facing=new_facing
		var target_offset=get_viewport_rect().size.x *look_ahead_factor * facing
		tween.interpolate_property(self, "position:x", position.x, target_offset, shift_duration, shift_Trans, shift_ease)
		tween.start()

func _on_player_1_grounded_updated(is_ground):
	drag_margin_v_enabled =!is_ground
