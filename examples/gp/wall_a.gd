extends Node3D

@export var bric_scene:PackedScene
@export var width:int = 10
@export var height:int = 10

func create_wall():
	for row in height:
		for col in width:
			var bric = bric_scene.instantiate()
			bric.position = Vector3(col, row * 1.1, 0)
			var newMaterial = StandardMaterial3D.new()
			
			newMaterial.albedo_color = Color.from_hsv(randf_range(0, 1), 1, 1, 0.8)
			bric.get_node("MeshInstance3D").material_override = newMaterial

			add_child(bric)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_wall()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
