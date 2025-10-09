extends Node3D

@export var target:Node3D
@export var player:Node3D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	global_position = lerp(global_position, target.global_position, delta)
	look_at(player.global_position)
	
	pass
