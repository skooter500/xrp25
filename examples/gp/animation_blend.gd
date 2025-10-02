extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_value_changed(value: float) -> void:
	var tree:AnimationTree = $"../Sofia/sophia/AnimationTree"
	tree["parameters/Blend2/blend_amount"] = value
	pass # Replace with function body.
