extends Node

var max_lives=3
var lives=max_lives
var hub

func lose_life2():
	Global2.lives-=1
	Global2.hub.load_heart()
	if Global2.lives<=0 :
			get_tree().change_scene("res://src/levels/Game over2.tscn")
		
	
