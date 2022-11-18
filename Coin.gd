extends Area2D



func _on_Coin_body_entered(body):
	$collect.play()

func _on_Coin_body_exited(body):
	queue_free()
