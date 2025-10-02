extends ColorRect

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var on:bool = true
var pitch:int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dist = speed * delta
	global_position.x -= dist
	if on:
		var old_size = size
		old_size.x += dist
		size = old_size
	if (global_position.x + size.x) < 0:
		get_parent().note_disappear(self)
		self.queue_free()
	pass
