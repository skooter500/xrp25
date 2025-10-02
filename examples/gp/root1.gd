extends Node2D

@export var custom_font : Font

func _ready():
	# DebugDraw2D.config.text_custom_font = custom_font	
	# DebugDraw2D.config.text_default_size = 24
	pass
	
func _input(event):
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.keycode == KEY_Q and key_event.pressed:
			get_tree().quit()
