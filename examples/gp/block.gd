extends Node2D

func _ready():
	scale = Vector2.ZERO
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 0.5)

	# tween.play("opacity", 1.0, 0.0, 2.0)


func _on_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
