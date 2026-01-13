extends Camera3D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	translate(Vector3(0, 0, - delta))
