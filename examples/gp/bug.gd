extends Area2D

@export var bomb_spawn:Node2D
@export var bomb_scene:PackedScene
@export var explosion_scene:PackedScene

var target_pos:Vector2

signal bug_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Tweens. Great for creating juice
	var tween = create_tween()
	$Sprite2D.scale = Vector2.ZERO
	tween.tween_property($Sprite2D, "scale", Vector2(1, 1), 1).set_trans(Tween.TRANS_ELASTIC)
	pass # Replace with function body.

var speed = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_pos, delta * speed)
	pass

func _on_timer_timeout():
	var offset = randf_range(-100, 100)
	target_pos = global_position
	target_pos.x += offset
	if target_pos.x < 20:
		target_pos.x = 20
	var w = get_viewport_rect().size.x
	if target_pos.x > w - 20:
		target_pos.x = w - 20 
	target_pos.y += 20
	if randi_range(0, 2) == 0:
		$AudioStreamPlayer2D.play()
	
		drop_bomb()
	
	pass # Replace with function body.


func drop_bomb():
	var bomb = bomb_scene.instantiate()
	bomb.global_position = bomb_spawn.global_position 
	get_parent().add_child(bomb)
	pass # Replace with function body.
