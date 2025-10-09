extends CharacterBody3D

@export var speed:float = -1
@export var rot_speed = 10.0

@export var bullet_scene:PackedScene
@export var bullet_spawn:Node3D

@export var fire_rate:int = 10

@onready  var timer = $Timer


func _time_out():
	can_fire = true

func _ready() -> void:
	timer.wait_time = 1.0 / fire_rate
	timer.connect("timeout", _time_out)
	pass 

var can_fire:bool = true

var right_left = 0 
var for_back = 0

func _physics_process(delta: float) -> void:
	
	var f = for_back
	
	var v = Vector3()	
	v = global_transform.basis.z # My direction vector	
	velocity = v * speed * f
	
	move_and_slide()
	
	var r = right_left
	
	rotate_y(- deg_to_rad(rot_speed) * r * delta)
	
	
	if can_fire and Input.is_action_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		can_fire = false
		bullet.global_position = bullet_spawn.global_position
		bullet.global_rotation = global_rotation
		timer.start()
	pass
	
@export var enemy:Node3D
	
