extends Node2D

# Calculate the hue that gives us pure blue (RGB: 0, 0, 1)
const BLUE_HUE = 4.0 / 6.0  # More precise than 0.6666

func _ready():
	get_viewport().connect("size_changed", _on_viewport_size_changed)
	queue_redraw()

func _on_viewport_size_changed():
	queue_redraw()

func _draw():
	var viewport_size = get_viewport_rect().size
	var num_stripes = 9
	var stripe_width = viewport_size.x / num_stripes
	
	# Draw each color stripe
	for i in range(num_stripes):
		var t = float(i) / (num_stripes - 1)
		
		# Create color using HSV
		# Hue: 0 (red) to BLUE_HUE (blue)
		# Saturation: 1 (full color)
		# Value: 1 (full brightness)
		var color = Color.from_hsv(t * BLUE_HUE, 1.0, 1.0)
		
		var rect = Rect2(
			i * stripe_width,  # x position
			0,                 # y position
			stripe_width,      # width
			viewport_size.y    # height
		)
		draw_rect(rect, color)
