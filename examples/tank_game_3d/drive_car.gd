extends Node

@onready var taxi:CharacterBody3D = $"../../../tank"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_left_input_vector_2_changed(name: String, value: Vector2) -> void:
	
	taxi.right_left = - value.x
	taxi.for_back = value.y
	
	pass # Replace with function body.
