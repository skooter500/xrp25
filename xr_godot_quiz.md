# XR Prototyping Quiz: Godot Implementation Examples

## Instructions
- This quiz covers the XR Sequencer and Tank Game 3D shooting system examples
- Answer all questions in the spaces provided
- For multiple choice questions, circle or highlight the correct answer(s)
- For code questions, explain your reasoning where requested

---

## Part 1: General Godot Concepts (20 points)

### 1. Which Godot node type is most appropriate for detecting when objects enter a specific area? (2 points)
   a) RigidBody3D
   b) StaticBody3D
   c) Area3D
   d) CollisionShape3D

### 2. In Godot, what is the purpose of the `_physics_process()` function compared to `_process()`? (2 points)
   a) It runs at a higher frame rate
   b) It runs at fixed time steps for consistent physics calculations
   c) It only processes physics objects
   d) It automatically handles collision detection

### 3. True or False: In Godot, signals are a built-in implementation of the Observer pattern. (2 points)

### 4. Which of the following is NOT a valid way to access a child node in Godot? (2 points)
   a) `$ChildNodeName`
   b) `get_node("ChildNodeName")`
   c) `child("ChildNodeName")`
   d) `find_node("ChildNodeName")`

### 5. What is the purpose of the `instantiate()` method when used with a PackedScene? (2 points)
   a) To load a scene from disk
   b) To create a new instance of a pre-loaded scene
   c) To save a scene to disk
   d) To unload a scene from memory

### 6. Fill in the blank: To make a node follow another node's position in 3D space, you would typically update its ________ property in the _process() or _physics_process() function. (2 points)

### 7. Which Godot class would you use to create a timer that triggers code after a specific duration? (2 points)
   a) Clock
   b) Timer
   c) TimeDelay
   d) Timeout

### 8. True or False: In Godot, the `queue_free()` method immediately removes a node from the scene tree. (2 points)

### 9. What does the `@export` annotation do in GDScript? (2 points)
   a) Makes a variable accessible from other scripts
   b) Exports the variable to a file
   c) Makes the variable appear in the Inspector panel
   d) Converts the variable to a different type

### 10. Which of these is the correct way to connect a signal in GDScript code? (2 points)
    a) `node.signal.connect(self, "method_name")`
    b) `node.connect("signal_name", self, "method_name")`
    c) `node.signal_name.connect(method_name)`
    d) `connect(node, "signal_name", "method_name")`

---

## Part 2: XR Sequencer Implementation (40 points)

### 11. In the XR Sequencer, what is the primary purpose of the `sequencer.gd` script? (2 points)
    a) To handle XR controller input
    b) To manage audio sample loading and playback
    c) To render 3D visuals
    d) To implement passthrough functionality

### 12. How does the XR Sequencer load audio samples? (3 points)
    a) From a hardcoded list of file paths
    b) From user input at runtime
    c) By scanning a directory for audio files
    d) From an external database

### 13. What Godot node type is used for the interactive pads in the XR Sequencer? (2 points)
    a) Button3D
    b) TouchButton
    c) Area3D
    d) CollisionShape3D

### 14. Explain how the XR Sequencer handles the visual feedback when a pad is toggled. (4 points)

### 15. In the XR Sequencer, what data structure is used to store the sequence pattern? (2 points)
    a) Dictionary
    b) Array
    c) 2D Array
    d) Linked List

### 16. Look at the following code snippet from the sequencer.gd script:
```gdscript
func play_step(col):
    var p = Vector3(s * col * spacer, s * -1 * spacer, 0)
    $timer_ball.position = p
    for row in range(rows):
        if sequence[row][col]:
            play_sample(0, row)
```
What is the purpose of this function? (3 points)

### 17. True or False: The XR Sequencer creates a new AudioStreamPlayer for each sound played. (2 points)

### 18. What is the purpose of the Timer node in the sequencer implementation? (2 points)
    a) To limit how long the application runs
    b) To control the tempo of the sequencer
    c) To measure user performance
    d) To handle animation timing

### 19. Fill in the blank: In the pad implementation, the `_on_area_entered` method is triggered when ________. (2 points)

### 20. How many AudioStreamPlayer nodes does the sequencer pre-create, and why is this approach used? (4 points)

### 21. What Godot feature is used to enable passthrough in the XR Sequencer? (3 points)
    a) Camera3D transparency
    b) XRInterface environment blend modes
    c) WorldEnvironment settings
    d) Material transparency

### 22. Examine this code from pad_a.gd:
```gdscript
func _on_area_entered(area: Area3D) -> void:
    toggle = !toggle
    set_mat()
```
What would you add to this function to make it only respond to controller interactions? (3 points)

### 23. How does the XR Sequencer organize the pads in 3D space? (3 points)

### 24. True or False: The XR Sequencer supports saving and loading patterns. (2 points)

### 25. What would be a potential performance optimization for the XR Sequencer? (3 points)

---

## Part 3: Tank Game 3D Shooting System (40 points)

### 26. In the Tank Game 3D, what node type is used for the tank itself? (2 points)
    a) RigidBody3D
    b) KinematicBody3D
    c) CharacterBody3D
    d) VehicleBody3D

### 27. How does the tank shooting system control the fire rate? (3 points)
    a) By limiting frames per second
    b) Using a cooldown variable and a Timer
    c) By checking the system clock
    d) Using a coroutine

### 28. What happens when a bullet collides with an object in the Tank Game? (3 points)

### 29. Examine this code snippet from tank.gd:
```gdscript
if can_fire and Input.is_action_pressed("shoot"):
    var bullet = bullet_scene.instantiate()
    get_parent().add_child(bullet)
    can_fire = false
    bullet.global_position = bullet_spawn.global_position
    bullet.global_rotation = global_rotation
    timer.start()
```
What would happen if the line `bullet.global_rotation = global_rotation` was removed? (3 points)

### 30. In the Tank Game 3D, what determines the direction a bullet travels? (2 points)
    a) The tank's velocity
    b) The bullet's global_transform.basis.z vector
    c) A random direction
    d) The player's input direction

### 31. True or False: The bullet in the Tank Game 3D is a RigidBody3D node. (2 points)

### 32. What type of node is used for the explosion effect in the Tank Game 3D? (2 points)
    a) CPUParticles3D
    b) GPUParticles3D
    c) Particles2D
    d) AnimatedSprite3D

### 33. Fill in the blank: When a bullet hits an object, the color of the explosion is determined by the ________ of the hit object. (2 points)

### 34. What is the purpose of the `look_at()` method in the bullet's `_physics_process()` function? (3 points)

### 35. How does the Tank Game 3D handle the destruction of objects hit by bullets? (3 points)
    a) It reduces their health until they reach zero
    b) It applies a force to push them away
    c) It calls queue_free() on them immediately
    d) It plays an animation before removing them

### 36. What would be a more efficient alternative to creating and destroying bullets for each shot? (3 points)

### 37. Examine this code from bullet.gd:
```gdscript
func _physics_process(delta: float) -> void:    
    var v = global_transform.basis.z
    global_position = global_position + v * speed * delta
    look_at(global_position - global_transform.basis.z)
```
What would happen if you changed the first line to `var v = transform.basis.z` instead? (3 points)

### 38. True or False: The explosion effect in the Tank Game 3D includes both visual and audio feedback. (2 points)

### 39. What design pattern is demonstrated by the way bullets are spawned in the Tank Game 3D? (2 points)
    a) Singleton
    b) Factory
    c) Observer
    d) Command

### 40. What would you add to the bullet implementation to prevent bullets from existing indefinitely if they never hit anything? (3 points)

---

## Bonus Question (5 points)

### 41. Describe how you would combine elements from both the XR Sequencer and Tank Game 3D to create a rhythm-based shooting game in VR. Include specific components and implementation details from both examples.

---

## Answer Key (For Instructor Use)

### Part 1
1. c
2. b
3. True
4. c
5. b
6. global_position
7. b
8. False (it schedules it for deletion at the end of the current frame)
9. c
10. c

### Part 2
11. b
12. c
13. c
14. It changes the material's albedo_color property based on the toggle state, switching between two exported colors (in_color and out_color).
15. c
16. This function plays all active samples for a specific column (step) in the sequence and moves the visual indicator (timer_ball) to that position.
17. False (it reuses AudioStreamPlayer nodes from a pre-created pool)
18. b
19. a VR controller/hand enters the pad's collision area
20. 50 AudioStreamPlayer nodes; this approach is used to avoid creating and destroying nodes frequently, which is inefficient. It allows multiple sounds to play simultaneously without delay.
21. b
22. Add a check like: `if area.name.contains("hand")` or check if the area is a child of an XRController3D
23. In a grid pattern with rows representing different samples and columns representing time steps
24. False
25. Possible answers: Using MultiMesh for the pads, optimizing audio loading, implementing pattern saving/loading, reducing particle effects

### Part 3
26. c
27. b
28. It creates an explosion effect, matches the explosion color to the hit object, and destroys both the bullet and the target
29. The bullet would still move in the correct direction but would not be visually oriented correctly
30. b
31. False (it's an Area3D)
32. b
33. albedo_color (or material color)
34. It ensures the bullet is oriented correctly along its direction of travel
35. c
36. Object pooling - pre-creating a pool of bullets and reusing them instead of instantiating and freeing
37. The bullet would move relative to its local orientation rather than the global orientation
38. True
39. b
40. Add a Timer that starts when the bullet is created and connects to a function that destroys the bullet when the timer expires

### Bonus
Evaluation based on creativity, technical understanding, and feasibility of implementation.