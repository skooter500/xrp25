extends MeshInstance3D

@onready var target = $"../target"

var q1:Quaternion
var q2:Quaternion
var t = 1

func _ready() -> void:
	look_at(target.global_position)

func _physics_process(delta: float):
	if Input.is_action_just_pressed("shoot"):
		q1 = global_basis.get_rotation_quaternion()
		
		q2 = Basis.looking_at(target.global_position).get_rotation_quaternion()
		t = 0
	if t < 1.0:
		var q = q1.slerp(q2, t)
		t = t + delta
		print(t)
		global_basis = Basis(q)
	pass
