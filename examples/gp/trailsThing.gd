extends Node2D

var fade_amount = 0.95  # Higher = longer trails
var frame_texture = null
var prev_frame_texture = null
var canvas_texture = null
var canvas_material = null

func _ready():
	# Create a shader material
	canvas_material = ShaderMaterial.new()
	canvas_material.shader = create_trail_shader()
	
	# Wait a frame to ensure viewport is ready
	await get_tree().process_frame
	
	# Get viewport texture
	var viewport = get_viewport()
	frame_texture = viewport.get_texture()
	
	# Create textures
	prev_frame_texture = ImageTexture.create_from_image(
		Image.create(viewport.size.x, viewport.size.y, false, Image.FORMAT_RGBA8)
	)
	
	# Set z_index to be behind other nodes
	z_index = -100

func create_trail_shader():
	var shader = Shader.new()
	shader.code = """
	shader_type canvas_item;
	
	uniform sampler2D prev_frame;
	uniform float fade_amount;
	
	void fragment() {
		vec4 current = texture(TEXTURE, UV);
		vec4 previous = texture(prev_frame, UV);
		
		COLOR = mix(current, previous, fade_amount);
	}
	"""
	return shader

func _process(_delta):
	# Update shader parameters
	canvas_material.set_shader_parameter("prev_frame", prev_frame_texture)
	canvas_material.set_shader_parameter("fade_amount", fade_amount)
	
	# Capture current frame to use in next frame
	var img = frame_texture.get_image()
	prev_frame_texture = ImageTexture.create_from_image(img)
	
	# Request redraw
	queue_redraw()

func _draw():
	# Draw the entire viewport with our trail shader
	var viewport_rect = get_viewport_rect()
	draw_rect(viewport_rect, Color.WHITE, true, -1.0, false)
