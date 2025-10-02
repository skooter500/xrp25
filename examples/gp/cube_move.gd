extends MeshInstance3D

@export var speed:float
@export var thing_scene:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(10):
		var thing:Node3D = thing_scene.instantiate()
		
		thing.global_position = Vector3(i * 2, 0, 0)
		add_child(thing)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var f:float = Input.get_axis("move_backwards", "move_forwards")
	print(f)
	global_position.x += speed * delta * f
	
	pass


func _on_timer_timeout() -> void:
	var thing:Node3D = thing_scene.instantiate()
	
	thing.global_position = Vector3(0, 5, 0)
	add_child(thing)

	pass # Replace with function body.
