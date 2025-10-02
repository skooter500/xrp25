extends Area3D

@export var speed:float=20

@export var explosion_scene:PackedScene

func _physics_process(delta: float) -> void:	
	var v = global_transform.basis.z
	global_translate(v * speed * delta)


func _on_timer_timeout() -> void:
	self.queue_free()
	pass # Replace with function body.


func _on_body_entered(b: Node3D) -> void:
		b.queue_free()
		self.queue_free()
		var explosion:GPUParticles3D = explosion_scene.instantiate()
		explosion.global_position = global_position
		explosion.emitting = true
		get_parent().add_child(explosion)
		pass
