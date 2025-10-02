extends DirectionalLight3D

# DAY/NIGHT CYCLE!!!!! AAAA quality
func _physics_process(delta: float) -> void:
	rotate_y(delta*0.1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
