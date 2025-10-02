extends CharacterBody2D

@export var speed = 20

@export var explosion:PackedScene

	
func _process(delta):
	velocity = -transform.y * speed
	var c =  move_and_collide(velocity * delta)
	if c:
		if c.get_collider().name.contains("block"):
			c.get_collider().queue_free()
			var e = explosion.instantiate()
			get_tree().get_root().add_child(e)
			e.global_position = self.global_position
			e.emitting = true
			self.queue_free()


func _on_timer_timeout():
	self.queue_free()
	pass # Replace with function body.
