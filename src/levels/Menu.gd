extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer1/Start Button".grab_focus()
	
	




func _on_Start_Button_pressed():
	Global.lives=Global.max_lives
	get_tree().change_scene("res://src/levels/Testkzt.tscn")


func _on_Bye_pressed():
	get_tree().quit()


func _on_Map_pressed():
	get_tree().change_scene("res://src/levels/Map.tscn")




func _on_Start_Button_mouse_entered():
	$chime.play()
	pass # Replace with function body.


func _on_Map_mouse_entered():
	$chime.play()
	pass # Replace with function body.


func _on_Bye2_mouse_entered():
	$chime.play()
	pass # Replace with function body.


func _on_Start_Button_mouse_exited():
	$chime.stop()
	pass # Replace with function body.


func _on_Map_mouse_exited():
	$chime.stop()
	pass # Replace with function body.


func _on_Bye2_mouse_exited():
	$chime.stop()
	pass # Replace with function body.


func _on_story_pressed():
	get_tree().change_scene("res://src/levels/story1.tscn")



func _on_story_mouse_entered():
	$chime.play()


func _on_story_mouse_exited():
	$chime.stop()
