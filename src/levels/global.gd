extends Node

var max_lives=3
var lives=max_lives
var hub

func lose_life():
	lives-=1
	hub.load_heart()
	if lives<=0:
		get_tree().change_scene("res://src/levels/levelTemplate.tscn")
