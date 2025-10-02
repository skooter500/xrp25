extends CharacterBody2D

func _ready():
	OS.open_midi_inputs()
	print(OS.get_connected_midi_inputs())

@export var speed:float=10

# Called when the node enters the scene tree for the first time.
func _input(input_event):
	if input_event is InputEventMIDI:
		_print_midi_info(input_event)
		if input_event.channel == 74:
			if input_event.controller_value < 10:
				position.y -= speed
			else:
				position.y += speed

func _print_midi_info(midi_event: InputEventMIDI):
	print(midi_event)
	print("Channel " + str(midi_event.channel))
	print("Message " + str(midi_event.message))
	print("Pitch " + str(midi_event.pitch))
	print("Velocity " + str(midi_event.velocity))
	print("Instrument " + str(midi_event.instrument))
	print("Pressure " + str(midi_event.pressure))
	print("Controller number: " + str(midi_event.controller_number))
	print("Controller value: " + str(midi_event.controller_value))

func _physics_process(delta):
	if Input.is_key_pressed(KEY_Q):
		position.y -= speed * delta
	if Input.is_key_pressed(KEY_A):
		position.y -= speed * delta
