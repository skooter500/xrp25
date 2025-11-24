extends RigidBody3D

var power = 0.1

func  _physics_process(delta: float) -> void:
	print(inertia)
	if Input.is_key_pressed(KEY_Y):
		add_constant_force(Vector3.UP * power)	
	if Input.is_key_pressed(KEY_H):
		apply_torque(Vector3.FORWARD * power)
	if Input.is_key_pressed(KEY_L):
		apply_force(Vector3.DOWN * power, Vector3(0, 0, -2))
	
