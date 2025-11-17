extends MeshInstance3D

var gravity = 9.8
var height = 830
var calc_time:float
var calc_speed:float

var v:Vector3 = Vector3.ZERO

@onready var ground = $"../StaticBody3D"

func _ready() -> void:
	calc_time = sqrt((height / (.5 * gravity)))
	print(calc_time)
	calc_speed = gravity * calc_time
	print(calc_speed)

var time_accum = 0

func _physics_process(delta: float) -> void:
	if position.y > 0: 
		v = v + Vector3(0, -gravity, 0) * delta
		position = position + v * delta
		time_accum += delta
	else:
		print(v)
		print(time_accum)
	
	
	
