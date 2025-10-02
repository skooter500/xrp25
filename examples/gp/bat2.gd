extends CharacterBody2D

@export var speed:float=50

#func _input(event):
	#if event is InputEventKey and event.keycode == KEY_Q:
		#position.y -= 50

func _physics_process(delta):
	$"../RichTextLabel".text = str(delta)
	if Input.is_key_pressed(KEY_W):
		position.y -= speed * delta
	if Input.is_key_pressed(KEY_S):
		position.y += speed * delta


func _on_button_pressed():
	position.x += 10
	pass # Replace with function body.
