extends CharacterBody3D

var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var lerped_f:float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var f = Input.get_axis("back", "forward")
	
	lerped_f = lerp(lerped_f, f, delta * 5.0)
	
	$sophia/AnimationTree.set("parameters/Blend2/blend_amount", lerped_f)
	
	var lr = Input.get_axis("left", "right")	
	velocity = global_basis.z * speed * lerped_f
	
	rotate_y(- lr * delta)
	
	move_and_slide()
	
	pass
