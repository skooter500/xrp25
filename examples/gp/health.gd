# Run in editor
@tool

# Make a class called Dude
class_name Health

# Subclass of CharacterBody2D. We use CharacterBody2D to create player characters, bullets and enemies
extends CharacterBody2D

@export var size = 100
@export var line_size = 3
@export var color:Color = Color.WHITE
@onready var radius = size / 2 

var rot_speed:float = 60

var move_dir:Vector2
var move_speed = 20

var life_time:float=10
var alive = 0

func on_timeout():
	self.queue_free()

func _ready():
	move_dir = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	move_dir = move_dir.normalized()
	
	if ! Engine.is_editor_hint():	
		$Timer.wait_time = life_time
		$Timer.timeout.connect(on_timeout)
		$Timer.start()
		
		scale = Vector2.ZERO
		var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "scale", Vector2.ONE, 1)
	

func _draw():	
	var r = Rect2(-radius, -radius, size, size) 

	var alp_color = color
	if ! Engine.is_editor_hint():	
		alp_color.a = 1.0 - (alive / life_time)

	draw_rect(r, alp_color, false, line_size)
	draw_line(Vector2(0, -radius), Vector2(0, radius), alp_color, line_size) 
	draw_line(Vector2(-radius, 0), Vector2(radius, 0), alp_color, line_size) 
	
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
	
func die():
	scale = Vector2.ONE
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.5)

	tween.tween_callback(self.queue_free)



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("body")
	pass # Replace with function body.
