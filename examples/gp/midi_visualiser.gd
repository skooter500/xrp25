extends Node2D

@export var note_scene:PackedScene

var notes:Dictionary

func play_note(me):
	$BlipSelect9.pitch_scale = remap(me.pitch, 0, 127, 0, 10)
	$BlipSelect9.play()

func note_disappear(note):
	notes.erase(note.pitch)
	remove_child(note)

func create_note(me):
	var note = note_scene.instantiate()
	note.pitch = me.pitch
	var rect:Rect2 = get_viewport_rect()
	var size:Vector2 = rect.size
	var y = remap(me.pitch, 0, 128,0, rect.size.y)
	print(note.pitch)
	print(y)
	note.global_position.x = rect.size.x - (note.size.x / 2)
	note.global_position.y = y
	note.pitch = me.pitch
	notes[me.pitch] = note
	note.color = Color.from_hsv(randf(), 1, 1)
	add_child(note)
	
		

func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

func _input(input_event):
	if input_event is InputEventMIDI:
		var me:InputEventMIDI = input_event
		if me.message == 9:			
			create_note(me)
			play_note(me)
			# _print_midi_info(me)
		if me.message == 8:
			if notes.has(me.pitch): 
				notes[me.pitch].on = false			
		
func _print_midi_info(midi_event):
	
	print(midi_event)
	print("Channel ", midi_event.channel)
	print("Message ", midi_event.message)
	print("Pitch ", midi_event.pitch)
	print("Velocity ", midi_event.velocity)
	print("Instrument ", midi_event.instrument)
	print("Pressure ", midi_event.pressure)
	print("Controller number: ", midi_event.controller_number)
	print("Controller value: ", midi_event.controller_value)
