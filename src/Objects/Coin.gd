extends Node2D


onready var anim_player : AnimationPlayer= get_node("AnimationPlayer")


func _on_Coin_body_entered(_body :PhysicsBody2D) -> void:
	anim_player.play("fade")


