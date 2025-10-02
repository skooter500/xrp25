extends MeshInstance3D

@export var sped = 15
@export var target:MeshInstance3D
@export var explode:GPUParticles3D
var current_move_speed = 0.0
var current_rotate_speed = 0.0

func _physics_process(delta: float) -> void:
	var speed_scale = Vector2(0,0)
	speed_scale.y = Input.get_axis("Down", "Up")
	speed_scale.x = Input.get_axis("Left", "Right")
	
	if Input.is_action_just_pressed("Bang"):
		look_at(target.position)
		explode.emitting = true
	
	current_move_speed = lerp(current_move_speed, sped*speed_scale.y, 0.03)
	current_rotate_speed = lerp(current_rotate_speed, sped*speed_scale.x, 0.1)
	translate(Vector3(0,0, -current_move_speed * delta))
	rotate_y(current_rotate_speed * delta * -0.1)
		

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
