extends Node2D

@export var min_radius_increment := 2.0
@export var max_radius_increment := 10.0
@export var min_theta_increment := 1.0
@export var max_theta_increment := 5.0
@export var max_radius := 700.0
@export var line_weight := 2.0
@export var reset_delay := 3.0

var cx: float
var cy: float
var r_inc: float
var theta_inc: float
var dir: int=1
var iterations = 100
var color_hue_start = 0
var alpha_inc:float=0.0 
var hue_inc:float=0.0

var thickness = 2 

func rand():
	color_hue_start = randf_range(0, 1) 
	iterations = randf_range(5, 30) 
	thickness = 5
	hue_inc = randf_range(0, 10)
	alpha_inc = randf_range(0, 1)
	target_theta_inc = randf_range(0.1, TAU) 
	r_inc = randf_range(1, 3)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_SPACE:
		rand()
	pass
	
func _ready() -> void:
	rand()
	scale = Vector2.ZERO
	
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 1)
		
 
func _process(delta: float) -> void:
	queue_redraw()    
	pass

func _draw() -> void:	
	var px = 0
	var py = 0
	var r = 5
	var theta:float=0
	var color_hue = color_hue_start
	var alpha = 1
	theta_inc = lerp(theta_inc, target_theta_inc, 0.1)
	for i in iterations:
		var x = sin(theta) * r
		var y = (cos(theta) * dir) * r
		var c:Color = Color.from_hsv(color_hue, 1, 1, alpha)
		draw_line(Vector2(px, py), Vector2(x, y), c , thickness)	
		var s = Vector2(1, 2)	
		# draw_set_transform(Vector2.ZERO, 0, s)		
		draw_circle(Vector2(px, py), 1, c, false, thickness)
		# draw_set_transform(Vector2.ZERO, 0, Vector2.ONE)		
		r += r_inc
		theta += theta_inc
		color_hue += hue_inc * 0.01
		alpha -= alpha_inc * 0.01
		px = x
		py = y

var target_theta_inc  = 0.0 
