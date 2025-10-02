extends Area2D

func _ready():
	print("bla")

func _on_input_event(viewport, event, shape_idx):
	$AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_mouse_entered():
	print("m,ouse e")
	pass # Replace with function body.
