extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Dragon_body_entered(body):
	$dragon.play()


func _on_Dragon_body_exited(body):
	get_tree().change_scene("res://src/levels/Win.tscn")
