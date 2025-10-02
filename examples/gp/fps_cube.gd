extends MeshInstance3D

@export var speed = 10
@export var rot_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# position.x += delta * speed
	# position.z += delta * speed
	# translate(Vector3.FORWARD * delta * speed)
	# global_position.x += delta * speed
	rotate_y(deg_to_rad(rot_speed) * delta)
	pass
