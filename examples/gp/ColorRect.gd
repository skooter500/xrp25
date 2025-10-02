extends ColorRect

var speed = 100
var rot_speed = 180

func _ready():
	pass

func _process(delta):
	position.x += speed * delta
	var r = get_viewport_rect()
	print(r)
	# if position.x > r.size.x
	# rotation += deg_to_rad(rot_speed) * delta
	pass
	
