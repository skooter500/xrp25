extends Area2D

func _on_mouse_entered():
	print("Mouse entyered")
	pass # Replace with function body.


func _on_mouse_shape_entered(shape_idx):
	print("Mouse shape entered")

	pass # Replace with function body.

func _physics_process(delta):
	position.x += 1

func _on_area_entered(area):
	print("area entered " + str(area))
	pass # Replace with function body.


func _on_area_exited(area):
	print("area exited " + str(area))

	pass # Replace with function body.
