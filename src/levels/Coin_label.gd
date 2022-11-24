extends Label

var score= 0 setget set_score 

func set_score(value):
	score = value
	get_node("/root/Coin_label/Display/SCORE").set_text("SCORE: "+str(score))
