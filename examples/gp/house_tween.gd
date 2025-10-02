extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var t = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	t.tween_property(self, "position", position + Vector3.RIGHT * 5, 3)
	t.tween_property(self, "position", position - Vector3.RIGHT * 5, 3)
	t.set_loops()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
