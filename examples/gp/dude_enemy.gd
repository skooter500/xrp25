extends CharacterBody2D

@export var speed = 200

var color:Color = Color.WHITE

var dude

enum State {IDLE, ATTACKING}

var state:State = State.IDLE

func _ready() -> void:
	dude = $"../dude"
	
func _physics_process(delta: float) -> void:
	
	if state == State.ATTACKING:		
		var to_player:Vector2 = dude.position - position
		to_player = to_player.normalized()	
		velocity = to_player * speed
		var theta = atan2(to_player.y, to_player.x) + (PI * 0.5)
		rotation = theta 
		move_and_slide()
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == dude:
		state = State.ATTACKING
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == dude:
		state = State.IDLE

	pass # Replace with function body.
