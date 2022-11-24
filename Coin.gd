extends Area2D



func _on_Coin_body_entered(player):
	$collect.play()



func _on_Coin_body_exited(player):
	queue_free() 
