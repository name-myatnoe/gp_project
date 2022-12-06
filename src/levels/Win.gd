extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer3.grab_focus()

func _on_Main_menu_pressed():
	get_tree().change_scene("res://src/levels/Menu.tscn") 


func _on_bg_ready():
	$bg.play() 


func _on_Main_menu_mouse_entered():
	$chime.play()
	


func _on_Main_menu_mouse_exited():
	$chime.stop()




func _on_Next_mouse_entered():
	$chime.play()

func _on_Next_mouse_exited():
	$chime.stop()


func _on_Next_pressed():
	Global2.lives=Global2.max_lives
	get_tree().change_scene("res://src/levels/L2.tscn")
