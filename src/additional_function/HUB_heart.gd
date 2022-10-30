extends CanvasLayer

func _ready():
	load_heart()
	Global.hub=self

func load_heart():
	$HeartFull.rect_size.x=Global.lives*53
	$HeartEmpty.rect_size.x=(Global.max_lives - Global.lives)*53
	$HeartEmpty.rect_position.x=$HeartFull.rect_position.x+$HeartFull.rect_size.x*$HeartFull.rect_scale.x


