extends Area2D

func play():
	if $AudioStreamPlayer2D.stream:
		$AudioStreamPlayer2D.play()	

func _on_input_event(viewport, event, shape_idx):
	print(event)
	if event is InputEventScreenTouch && event.is_pressed(): 
		play()
	pass # Replace with function body.




func _on_mouse_entered():
	play()
	pass # Replace with function body.
