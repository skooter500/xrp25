extends CharacterBody2D

@export var player:Node2D

@export var speed:float = 200

@export var size = 100
@export var line_size = 2
@export var color:Color = Color.RED
@onready var radius = size / 2 

func _draw() -> void:
	# Draw the dude's shape
	draw_line(Vector2(-radius, radius), Vector2(0, -radius), color, line_size)
	draw_line(Vector2(radius, radius), Vector2(0, -radius), color, line_size)
	draw_line(Vector2(-radius, radius), Vector2(0, 0), color, line_size)
	draw_line(Vector2(radius, radius), Vector2(0, 0), color, line_size)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = $"../../dude"
	queue_redraw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	var to_player = player.global_position - global_position	
	to_player = to_player.normalized()
	velocity = to_player * speed
	move_and_collide(velocity * delta)
	pass
