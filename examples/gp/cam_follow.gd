extends Camera3D

@export var target:Node3D
@export var cam_target:Node3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = lerp(global_position, cam_target.global_position, delta * 5)
	look_at(target.global_position)
	pass
