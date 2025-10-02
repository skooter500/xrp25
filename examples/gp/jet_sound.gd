extends AudioStreamPlayer2D


@onready var player = $".."
# Called when the node enters the scene tree for the first time.
func _ready():
	volume_db = -80
	play()
	pass # Replace with function body.

var f = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	f = lerp(f, abs(player.f), delta * 2)
	volume_db = remap(f, 0, 1, -80, 10)
	pass
