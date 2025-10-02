# run in editor
@tool
# give it a class name
class_name Ufo

# subclass of CharacterBody2D
extends CharacterBody2D

@export var radius = 20

@export var color:Color = Color.WHITE
@export var explosion:PackedScene
@export var line_size:float = 3

@export var bullet_scene:PackedScene
@export var bullet_spawn:Node2D

@export var loot_array:Array[PackedScene]

var can_fire = false

func movement():
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "rotation", PI, 2)		
	tween.tween_property(self, "position", position + Vector2.RIGHT * 200, 2)
	tween.tween_property(self, "color", Color.from_hsv(randf_range(0, 1), 1,1), 3)		
	tween.tween_property(self, "position", position + Vector2.LEFT * 200, 2)
	tween.tween_property(self, "position", position + Vector2.UP * 200, 2)
	tween.tween_property(self, "position", position + Vector2.DOWN * 200, 2)
	tween.finished.connect(movement)
		
	pass

func _ready() -> void:
	# Tween my scale using elastic	
	if ! Engine.is_editor_hint():
		scale = Vector2.ZERO
		var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "scale", Vector2.ONE, 1)
		tween.finished.connect(movement)
		# vary the pitch
		$Synth.pitch_scale = randf_range(0.7, 1.3)
		# wait 2 seconds
		await get_tree().create_timer(2.0).timeout		
		randomise_timer()
		
func randomise_timer():
	# randomise the wait time
	$Timer.wait_time = randf_range(1, 5)
	$Timer.start()
	
func drop_loot():
	
	var i = randi_range(0, loot_array.size() - 1)
	var loot = loot_array[i].instantiate()
	loot.position = position
	get_parent().add_child(loot)
	pass

func _draw() -> void:
	
	# Draw the ufo arc between pi and 2 pi
	draw_arc(Vector2.ZERO, radius, PI, TAU, 6, color, line_size)
	# draw the rect part
	draw_rect(Rect2(-radius * 2, 0, radius * 4, radius), color, false, line_size)
	# Draw small lights (circles) on the body
	for i in range(5):
		var light_rad = radius * 0.1
		var light_pos = Vector2(remap(i, 0, 4, (-radius * 2) + light_rad * 4, (radius * 2) - light_rad * 4), radius * 0.5)
		draw_circle(light_pos, radius * 0.1, color, false, line_size)
	pass
	 
func _process(delta):
	queue_redraw()
	pass


func _on_timer_timeout() -> void:
	# drop a bullet
	var b = bullet_scene.instantiate()
	b.global_position = bullet_spawn.global_position
	# rotate it downwards
	b.global_rotation = PI
	get_parent().add_child(b) 
	b.color = color
	b.line_size = line_size
	# make sure it doesnt collide the the other ufo's
	b.set_collision_mask_value(3, false)
	b.set_collision_mask_value(1, true)
	# restart the timer for the next bullet
	randomise_timer()
	pass # Replace with function body.
