extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# Examples of GDScript syntax
	var f:float
	var g:float
	var h:float	
	f = 10 # assignment of a value to a float
	g = 20
	h = 3	
	f += 2 # add 2 to f
	f = f + 2
	g = f - 5	
	h *= 2
	g = h / 3	# divide h by 3
	var j:int	
	var k:int
	var l:int
	
	j = 4
	k = 10
	l = k / j
	
	print(j)
	print(k)
	print(l)
	
	print(f)
	print(g)
	print(h)	
	
	# The if statement! For checking things	
	var score:int = 9
	
	if score == 10:
		print("You got the max score")
	if score > 5 and score < 9:
		print("You got a good score")
	if score <=5:
		print("Try harder!")
	
	# Loops! Do things many times
	
	for i in range(5):
		print(i)
		
	print()	
	# start at 1 finish at 4
	for i in range(1, 5):
		print(i) 

	print()
	# start at 4 finish at 0
	for i in range(5, -1, -1):
		print(i) 

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
