extends Node

onready var active = 1

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		if active != 2:
			active +=1
		else:
			active = 1
			
	pass
	
