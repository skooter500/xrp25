extends CharacterBody2D

func _input(event):
	pass

func _ready():
	pass
	
@export var speed:float=10
	
func _physics_process(delta):
	# position.x += 1
	pass
	
func _process(delta):
	position.y += 1
	velocity = Vector2.DOWN * 50
	var b = move_and_collide(velocity)
	if b:
		print(b)
	pass
	
