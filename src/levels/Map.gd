extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer4.grab_focus()





func _on_Main_menu_pressed():
	get_tree().change_scene("res://src/levels/Menu.tscn") 


func _on_bg_ready():
	$bg.play()




func _on_1_mouse_entered():
	$chime.play()
	pass 


func _on_1_mouse_exited():
	$chime.stop()
	pass # Replace with function body.


func _on_2_mouse_entered():
	$chime.play()
	pass # Replace with function body.


func _on_2_mouse_exited():
	$chime.stop()
	pass # Replace with function body.


func _on_back_mouse_entered():
	$chime.play()


func _on_back_mouse_exited():
	$chime.stop()
	pass # Replace with function body.


func _on_1_pressed():
	Global.lives=Global.max_lives
	get_tree().change_scene("res://src/levels/Testkzt.tscn") 
