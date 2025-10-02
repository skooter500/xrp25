
class_name DudeBullet

extends CharacterBody2D

@export var speed = 20
@export var color:Color = Color.WHITE
@export var explosion:PackedScene
@export var line_size:float = 3


func _ready() -> void:
	# randomly vary pitch
	$LaserShoot.pitch_scale = randf_range(0.1, 2)

func _draw():
	# a single line
	draw_line(Vector2(0, 10), Vector2(0, -10), color, line_size)
	
func _process(delta):
	# move in my forward direction
	velocity = -transform.y * speed
	var c =  move_and_collide(velocity * delta)
	if c: 
		var coll = c.get_collider()
		if coll.is_in_group("ufo"):
			print("collided with a ufo")	
			# update the ufo count			
			var uc = $"../dude".ufo_count
			$"../dude".ufo_count = uc + 1
			$"../CanvasLayer/ufo_count".text = "UFO COUNT:" + str($"../dude".ufo_count)
			# delete the ufo
			c.get_collider().drop_loot()
			c.get_collider().queue_free()
			
		elif coll.is_in_group("dude"):
			coll.lives = coll.lives - 1
			print("collided with a dude")
			# respawn the dude
			coll.respawn()
			pass
		# create an explosion
		
		
		
		var e = explosion.instantiate()
		e.modulate = coll.color
		get_parent().add_child(e)
		e.global_position = self.global_position
		e.emitting = true
		self.queue_free()
		

func _on_timer_timeout():
	self.queue_free()
	pass # Replace with function body.
