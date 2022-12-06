extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Background music".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Main_menu_mouse_entered():
	$chime.play()


func _on_Main_menu_mouse_exited():
	$chime.stop()


func _on_Next_mouse_entered():
	$chime.play()


func _on_Next_mouse_exited():
	$chime.stop()





func _on_Main_menu_pressed():
	get_tree().change_scene("res://src/levels/Menu.tscn")


func _on_Next_pressed():
	get_tree().change_scene("res://src/levels/story2.tscn")


func _on_test_pressed():
	get_tree().change_scene("res://src/levels/story2.tscn")
