extends CanvasLayer

func _ready():
	load_heart2()
	Global2.hub=self

func load_heart2():
	$HeartFull.rect_size.x=Global2.lives*53
	$HeartEmpty.rect_size.x=(Global2.max_lives - Global2.lives)*53
	$HeartEmpty.rect_position.x=$HeartFull.rect_position.x+$HeartFull.rect_size.x*$HeartFull.rect_scale.x


