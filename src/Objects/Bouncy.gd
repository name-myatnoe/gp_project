extends Area2D

onready var animSprite=$Sprite

func _physics_process(_delta):
	var bodies=get_overlapping_bodies()
	for body in bodies:
		if body.name=="player" or body.name=="player2":
			animSprite.play("hurt")
			$bounce.play()
			yield(animSprite,"animation_finished") 
			animSprite.play("idle ")
		else:
			animSprite.play("idle ")
	
