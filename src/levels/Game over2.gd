extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer2.grab_focus()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Main_menu_pressed():
	get_tree().change_scene("res://src/levels/Menu.tscn")


func _on_Main_menu_mouse_entered():
	$chime.play()
	pass # Replace with function body.


func _on_again_mouse_entered():
	$chime.play()
	pass # Replace with function body.

func _on_Main_menu_mouse_exited():
	$chime.stop()
	pass # Replace with function body.

func _on_again_mouse_exited():
	$chime.stop()
	pass # Replace with function body.


func _on_bg_ready():
	$bg.play()

func _on_L2again_pressed():
	Global2.lives=Global2.max_lives
	get_tree().change_scene("res://src/levels/L2.tscn")
