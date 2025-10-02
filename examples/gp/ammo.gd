# Run in editor
@tool

# Make a class called Dude
class_name Ammo

# Subclass of CharacterBody2D. We use CharacterBody2D to create player characters, bullets and enemies
extends CharacterBody2D

@export var num_points:int = 6
@export var size = 100
@export var line_size = 3
@export var color:Color = Color.WHITE
@onready var radius = size / 2 

var rot_speed:float = 60

var move_dir:Vector2
var move_speed = 20

var life_time:float=10
var alive:float = 0

func on_timeout():
	self.queue_free()
	
func die():
	scale = Vector2.ONE
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.5)
	tween.tween_callback(self.queue_free)

	

func _ready():
	move_dir = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	move_dir = move_dir.normalized()
	if ! Engine.is_editor_hint():
		$Timer.wait_time = life_time
		$Timer.timeout.connect(on_timeout)
		
		scale = Vector2.ZERO
		var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "scale", Vector2.ONE, 1)
		

func _draw():	
	var theta_inc = TAU / float(num_points)
	var px = 0
	var py = radius
	for i in num_points + 1:
		var theta = theta_inc * i
		var x = sin(theta) * radius
		var y = cos(theta) * radius
		var alp_color = color
		alp_color.a = 1.0 - (alive / life_time)
		draw_line(Vector2(px, py), Vector2(x, y), alp_color , line_size)	
		px = x
		py = y
	
func _process(delta):

	if ! Engine.is_editor_hint():	
		alive = alive + delta
	queue_redraw()
	pass	

func _physics_process(delta: float) -> void:
	if ! Engine.is_editor_hint():	
		rotate(deg_to_rad(rot_speed) * delta)
		velocity = move_dir * move_speed
		move_and_slide()
		pass
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("body")
	pass # Replace with function body.
