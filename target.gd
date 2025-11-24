extends MeshInstance3D

var speed = 10

func  _physics_process(delta: float) -> void:
	var m = Input.get_axis("back", "forward")	
	translate(Vector3.FORWARD  * delta * speed * m)

	var l = Input.get_axis("left", "right")	
	translate(Vector3.RIGHT  * delta * speed * l)

	var u = Input.get_axis("up", "down")	
	translate(Vector3.UP  * delta * speed * u)
