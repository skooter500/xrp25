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
var dir: int
var iterations = 100
var color_hue_start 
var alpha_inc:float=0.0 
var hue_inc:float=0.0
 
func _ready() -> void:
	reset()
	
func _input(event: InputEvent) -> void:
	if event is InputEventAction && event.pressed && event.action == "reset_spiral" &&  not event.is_echo():
		reset()
 
func reset() -> void:
	queue_redraw()
	var viewport_size = get_viewport_rect().size
	cx = 0
	cy = 0	
	target_theta_inc = randf_range(min_theta_increment, max_theta_increment)
	 
	dir = 1 if randi() % 2 == 0 else -1
	color_hue_start = 0
	 
	r_inc = randf_range(0, 10)
	# theta_inc = randf_range(0, 6)

	color_hue_start = randf_range(0, 1) 
	iterations = randi_range(10, 500) 
	thickness = randf_range(1, 50)
	hue_inc = randf_range(0, 1)
	alpha_inc = randf_range(0, 1)
	
	$"../r_inc".value = r_inc
	$"../theta_inc".value = target_theta_inc
	$"../iterations".value = iterations
	var old_color = $"../ColorPickerButton".color
	$"../ColorPickerButton".color = Color.from_hsv(color_hue_start, 1, 1, old_color.a)
	$"../alpha".value = alpha_inc
	$"../thickness".value = thickness
	$"../hue".value = hue_inc
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			reset()

func _process(delta: float) -> void:
	queue_redraw()    
	rotation = lerp(rotation, Input.get_axis("forward", "back") * PI, 
	delta)
	
	
	# global_position.x += delta * 100
	pass



func _draw() -> void:	
	var px = cx
	var py = cy
	var r = 5
	var theta:float=0
	var color_hue = color_hue_start
	var alpha = $"../ColorPickerButton".color.a
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
		
		

func _on_r_inc_value_changed(value: float) -> void:
	r_inc = value
	pass # Replace with function body.


func _on_theta_inc_value_changed(value: float) -> void:
	target_theta_inc = value
	pass # Replace with function body.

var target_theta_inc  = 0.0 


func _on_iterations_value_changed(value: float) -> void:
	iterations = value
	pass # Replace with function body.


func _on_color_picker_button_color_changed(color: Color) -> void:
	color_hue_start = color.h
	pass # Replace with function body.


func _on_h_slider_value_changed(value: float) -> void:
	hue_inc = value
	print(hue_inc)
	pass # Replace with function body.

func _on_h_slider_2_value_changed(value: float) -> void:
	alpha_inc = value
	pass # Replace with function body.

var thickness:float = 1

func _on_thickness_value_changed(value: float) -> void:
	thickness = value
	pass # Replace with function body.
