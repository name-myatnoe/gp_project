extends Area2D

func _on_Coin_body_entered(body):
	$collect.play()
	$Timer.start()

func _on_Timer_timeout():
	queue_free()
