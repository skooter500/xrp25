extends CharacterBody2D


var speed = 100

var attacking = false

func _process(delta):
	if attacking:
		position.x = position.x - speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "jump_dude":
		attacking = true
	pass # Replace with function body.
