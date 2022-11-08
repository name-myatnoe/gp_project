extends TextureButton


var music_bus= AudioServer.get_bus_index("Master")



func _on_TextureButton_pressed():
	$"../Background music".stream_paused
