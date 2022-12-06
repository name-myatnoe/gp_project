extends Node

var max_lives=3
var lives=max_lives
var hub

func lose_life():
	Global.lives-=1
	Global.hub.load_heart()
	if Global.lives<=0 :
			get_tree().change_scene("res://src/levels/Game over.tscn")
	
