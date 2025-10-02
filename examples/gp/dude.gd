# Run in editor
@tool

# Make a class called Dude
class_name Dude

# Subclass of CharacterBody2D. We use CharacterBody2D to create player characters, bullets and enemies
extends CharacterBody2D

@export var size = 100
@export var line_size = 2
@export var color:Color = Color.WHITE
@onready var radius = size / 2 

# So I can create multiple players with different inputs
@export var turn_left_input:String
@export var turn_right_input:String
@export var forward_input:String
@export var back_input:String


@export var turn_rate:float=180
@export var speed:float=100

# Used to create the bullets
@export var bullet_scene:PackedScene
@export var bullet_spawn:Node2D

@export var lives:int = 100
@export var ammo:int = 100
@export var ufo_count:int = 0

# If crash create explosion
@export var explosion:PackedScene

# The timer will reset this later 
var can_fire = true


func respawn():
	# Tween my scale using elastic
	scale = Vector2.ZERO
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 1)
	
	position = Vector2.ZERO
	rotation = randf_range(0, TAU)
	# Randomly vary the pitch of the audio and play it
	get_node("Synth2").pitch_scale = randf_range(0.1, 2.2)
	get_node("Synth2").play()

func _draw() -> void:
	# Draw the dude's shape
	draw_line(Vector2(-radius, radius), Vector2(0, -radius), color, line_size)
	draw_line(Vector2(radius, radius), Vector2(0, -radius), color, line_size)
	draw_line(Vector2(-radius, radius), Vector2(0, 0), color, line_size)
	draw_line(Vector2(radius, radius), Vector2(0, 0), color, line_size)

# implement basic physics
# Pressing forward or back generates acceleration
var acceleration:Vector2

func _process(delta: float) -> void:

	radius = size / 2
	queue_redraw() # make draw happen
	
	# if not running in engine, update the lives ui
	if ! Engine.is_editor_hint():	
		$"../CanvasLayer/lives".text = "LIVES: " + str(lives)
		
		# if i can fire
		if Input.is_action_pressed("fire") and can_fire and ammo > 0:
			# create a bullet
			# set its position and rotation
			var b = bullet_scene.instantiate()
			b.global_position = bullet_spawn.global_position
			b.global_rotation = bullet_spawn.global_rotation
			
			# add to my parent
			# dont add to self, because then if the player moves, the bullet will move
			get_parent().add_child(b) 
			
			# set its color and linesize the same as mine
			b.color = color
			b.line_size = line_size
			
			can_fire = false
			ammo = ammo - 1
			$"../CanvasLayer/ammo".text = "AMMO: " + str(ammo)
			$Timer.start() # to set can_fire back to true
	pass
	
func _physics_process(delta: float) -> void:
	# only do this when in game
	if ! Engine.is_editor_hint():	
		# rotate with left and right
		var l = Input.get_axis(turn_left_input, turn_right_input)
		rotate(l * delta * deg_to_rad(turn_rate))
		
		# move by applying acceration
		var m = Input.get_axis(forward_input, back_input)
		acceleration = transform.y * m * speed
		velocity = velocity + acceleration * delta	
		var c = move_and_collide(velocity * delta)
		
		# if i collide with ufo
		if c:
			print("I collided")
			if c.get_collider().is_in_group("ufo"):
				print("I collided")
				lives -= 1			
				# set explosion color to be the color of the thing I collided with
				var e = explosion.instantiate()
				e.modulate = c.get_collider().color
				
				get_parent().add_child(e)
				e.global_position = self.global_position
				e.emitting = true
				ufo_count = ufo_count + 1
				# delete the ufo
				c.get_collider().queue_free()
				# respawn the player
				respawn()
			elif c.get_collider().is_in_group("health"):
					lives += 1
					$"PowerupSound".play()
					c.get_collider().set_collision_layer_value(1, false)						
					c.get_collider().die()
			elif c.get_collider().is_in_group("ammo"):
					ammo += 10
					$"PowerupSound".play()
					c.get_collider().set_collision_layer_value(1, false)											
					c.get_collider().die()
		else:
			velocity = velocity * 0.99
		
	
func _ready() -> void:
	if ! Engine.is_editor_hint():	
		respawn()
	pass


func _on_timer_timeout() -> void:
	# allow the player to fire again
	can_fire = true
	pass # Replace with function body.
