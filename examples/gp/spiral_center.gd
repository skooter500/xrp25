extends Node2D

@onready var spiral = $"../spiral"

func _on_viewport_size_changed():
	var viewport_size = get_viewport_rect().size
	var p = viewport_size / 2
	spiral.global_position = p

func _ready():
	_on_viewport_size_changed()	
	get_viewport().size_changed.connect(_on_viewport_size_changed)
