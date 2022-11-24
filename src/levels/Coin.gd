extends Area2D

signal coin_collected 

func _on_Coin_body_entered(body):
	$collect.play()
	$Timer.start()
	emit_signal("coin_collected")
	
func _on_Timer_timeout():
	queue_free()
