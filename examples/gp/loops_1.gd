extends Node2D

var num_c_lines = 50

func _ready() -> void:
	$Label/HSlider.value = num_c_lines
	pass
	
func _process(delta: float) -> void:
	queue_redraw()
	pass
	
func _draw() -> void:
	var r = Rect2(10, 10, 100, 30)
	draw_rect(r, Color.AQUA, false, 5)	
	draw_line(Vector2(50, 50), Vector2(200, 200), Color.BEIGE)	
	draw_circle(Vector2(500, 500), 100, Color.BLUE_VIOLET, true)
	
	var v = get_viewport_rect()
	
	draw_line(Vector2(0, v.size.y), Vector2(v.size.x, 0), Color.BISQUE)

	for i in range(10):
		print(i)	

	for i in range(10, -1, -1):
		print(i)
		
	var basket = ["apple", "bananna", "carrot"]
	
	for f in basket:
		print(f)
		
	for i in range(basket.size()):
		print(basket[i])
		
	var num_lines = 10
	var s = get_viewport_rect().size
	var w = s.x / num_lines
	
	for i in range(num_lines):
		draw_line(Vector2(i * w, 0), Vector2(i * w, s.y), Color.RED)
		
	var num_h_lines = 10
	var gap = 50
	var border = 100
	for i in range(num_h_lines):
		draw_line(Vector2(border, border + gap * i), 
		Vector2(v.size.x - border, border + gap * i), Color.GREEN_YELLOW) 
		
	
	
	gap = v.size.y / num_c_lines
	
	
	
	for i in range(num_c_lines):
		draw_line(Vector2(0, i * gap), Vector2(v.size.x, v.size.y - (i * gap)),
		Color.REBECCA_PURPLE)
		
	
	var num_circles = 10
	var diameter = v.size.x / num_circles
	var radius = diameter / 2
	
	for i in range(num_circles):
		var c = Vector2(radius + (i * diameter), 200)
		var h =  i / float(num_circles)
		draw_circle(c, radius, Color.from_hsv(h , 1, 1))
	pass


func _on_h_slider_value_changed(value: float) -> void:
	num_c_lines = value
	pass # Replace with function body.
