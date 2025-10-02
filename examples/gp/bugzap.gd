extends Node2D

var lives = 3
var score = 0

func _ready():
	pass

func _process(delta: float) -> void:
	$VSplitContainer/score.text = "SCORE: " + str(score)
	$VSplitContainer/lives.text = "LIVES: " + str(lives)
	
func game_over():
		get_tree().change_scene_to_file("res://bugzap_start.tscn")

		pass
	
# Quit the game
func _input(event):
	if event is InputEventKey:
		var key_event = event as InputEventKey
		if key_event.keycode == KEY_Q and key_event.pressed:
			get_tree().quit()

func _on_player_hit() -> void:
	if lives > 0:
		lives -= 1
		var p = $player.global_position
		var v:Rect2 = get_viewport_rect()
		p.x = v.get_center().x
	else:
		game_over()
	pass # Replace with function body.
	

func _on_player_bug_hit() -> void:
	score = score + 1
	pass # Replace with function body.
