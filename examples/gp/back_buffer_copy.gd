extends BackBufferCopy

func _ready():
	# Make sure copy mode is set to viewport
	copy_mode = BackBufferCopy.COPY_MODE_VIEWPORT
	
	# Create the shader material
	var trail_material = ShaderMaterial.new()
	trail_material.shader = preload("res://trail_shader.gdshader") # Or create inline below
	
	# Apply the material
	material = trail_material
