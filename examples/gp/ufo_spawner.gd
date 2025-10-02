extends Marker2D

# The thing to spawn
@export var ufo_scene:PackedScene

@export var radius:float = 200
@export var count:int = 20

@export var rate:int = 10

@export var auto_spawn = false



func spawn():
	print("begin spawning")
	var theta_inc = TAU / float(count)
	var color = Color.from_hsv(randf(), 1, 1, 0.9)		
	for i in count:
		await get_tree().create_timer(1 / float(rate)).timeout
		var theta = theta_inc * i
		var x = sin(theta) * radius
		var y = - cos(theta) * radius
		var ufo = ufo_scene.instantiate()
		# ufo.color = color
		ufo.position = position + Vector2(x, y)		
		get_parent().add_child(ufo)
		
func _ready():
	if auto_spawn:
		spawn()
