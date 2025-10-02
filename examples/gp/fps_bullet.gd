extends CharacterBody3D

@export var speed = 20


func _physics_process(delta: float) -> void:
	
	velocity = global_basis.z * speed
	move_and_slide()
	pass
	# move_and_slide()
