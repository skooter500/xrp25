extends Area2D

var speed = 300

func  _physics_process(delta):
	position.y += speed * delta
