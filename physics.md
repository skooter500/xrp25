---
marp: true
theme: default
paginate: true
style: |
  section {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 40px 60px 60px 60px;
  }
  section.title {
    justify-content: center;
    text-align: center;
  }
  section.physics {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
  }
  section.code {
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
  }
  section.concepts {
    background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
  }
  h1 {
    color: #fff;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    margin-top: 0;
    font-size: 1.8em;
  }
  h2 {
    color: #fff;
    border-bottom: 3px solid rgba(255,255,255,0.3);
    padding-bottom: 10px;
    font-size: 1.4em;
  }
  h3 {
    font-size: 1.2em;
    margin-bottom: 10px;
  }
  code {
    background: rgba(0,0,0,0.3);
    border-radius: 5px;
    padding: 2px 6px;
  }
  pre {
    background: rgba(0,0,0,0.4);
    border-radius: 10px;
    padding: 15px;
    margin: 10px 0;
  }
  table {
    background: rgba(255,255,255,0.1);
    border-radius: 10px;
  }
  .diagram-box {
    background: rgba(255,255,255,0.2);
    border-radius: 15px;
    padding: 15px;
    margin: 10px auto;
  }
  p, li {
    margin: 8px 0;
  }
---

<!-- _class: title -->

# 🎮 Game Engines
## ⚛️ Newtonian Physics in Godot

<br>

**Dr Bryan Duggan**
TU Dublin

📧 bryan.duggan@tudublin.org
🐦 @skooter500
🌐 http://bryanduggan.org

---

<!-- _class: concepts -->

# 📋 What we will cover

<div style="font-size: 1.3em; line-height: 2em;">

📐 **Coordinate Geometry**
📊 **Trigonometry**
➡️ **Vectors & Simple Movement**
🔄 **Transforms**
⚡ **Physics in Godot**

</div>

---

<!-- _class: physics -->

# 🔬 Newtonian Physics - Fundamentals

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

<div>

### ⏱️ Time
Scalar measured in **seconds (s)**

### 📏 Distance
Scalar measured in **Meters (m)**

</div>

<div>

### ⚖️ Mass
- Measure of the amount of matter
- Scalar measured in **Kg**
- Unit of matter

</div>

</div>

---

<!-- _class: physics -->

# 📍 Position & Velocity

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px;">

<div>

### Position Vector
```
    Y ↑
      |
      |    • Object (x,y,z)
      |   /
      |  /
      | /
      |/________→ X
     O (origin)
    /
   ↙ Z
```

- Vector relative to origin
- Centre of mass
- Balance point

</div>

---

<div>

### Velocity Vector
```
        → velocity
       /
      / 
     •─────────→
   Object    direction
```

**Formula:** `v = Δx / Δt`

- Has magnitude (speed)
- Has direction
- Measured in **m/s**

</div>

</div>

---

<!-- _class: physics -->

# ⚡ Acceleration

<div style="display: grid; grid-template-columns: 1.2fr 1fr; gap: 30px;">

<div>

### 📈 Rate of Change in Velocity

- Measured in **m/s²** or m/s/s
- **Formula:** `a = Δv / Δt`
- Change in velocity per time interval

```
Velocity increases over time
    ↑
  6 |        •
  4 |     •
  2 |  •
  0 |•_____________→
    0  1  2  3  Time (s)
```

</div>

<div class="diagram-box">

### 🚗 Example
Car accelerating at **2 m/s²**

| Time (s) | Velocity (m/s) |
|:--------:|:--------------:|
| 0        | 0              |
| 1        | 2 ⬆️            |
| 2        | 4 ⬆️⬆️           |
| 3        | 6 ⬆️⬆️⬆️          |

Every second adds 2 m/s!

</div>

</div>

---

<!-- _class: concepts -->

# 🧮 Velocity, Acceleration & Time

<div style="background: rgba(255,255,255,0.2); border-radius: 15px; padding: 25px; margin: 20px;">

### Linear Equation: `y = mx + c`

For constant acceleration:

<div style="font-size: 1.4em; text-align: center; margin: 20px; background: rgba(0,0,0,0.3); padding: 20px; border-radius: 10px;">

## **v = at + u**

</div>

- **v** = final velocity
- **a** = acceleration  
- **t** = time
- **u** = initial velocity (at t = 0)

</div>

### 💡 Example
Car starting at **3 m/s**, accelerating at **2 m/s²** for **3 seconds**:
`v = 2 × 3 + 3 = 9 m/s` ✅

---

<!-- _class: physics -->

# 📐 Distance Calculations

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">

<div>

### Area Under the Curve

```
Velocity
    ↑
  9 |       ┌────•
    |      /B   /
  6 |     /    /
    |    /    /
  3 |   /____/
    |  /  A /
  0 |_/_____/______→
    0   1   2   3  Time
```

**Area A** = `Δt × u`
**Area B** = `.5 × (v-u) × Δt`

</div>

<div class="diagram-box">

### 🎯 Final Formula

Since `v - u = Δv` and `Δv = a × Δt`:

<div style="font-size: 1.3em; text-align: center; background: rgba(0,0,0,0.4); padding: 20px; border-radius: 10px; margin: 15px 0;">

**Δx = u Δt + ½a Δt²**

</div>

This gives us **displacement**!

</div>

</div>

---

<!-- _class: concepts -->

# 💪 Force

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">

<div>

### What is Force?

- Can alter speed or direction
- **NOT** motion itself
- Only required for **change**
- No force needed to keep moving

```
    Wind →
        ↓
    ┌───┴───┐
    │ Arrow │ →→→
    └───────┘
     ↑ thrust
   (initial)
```

</div>

<div class="diagram-box">

### Multiple Forces

```
     ↑ Table support
     |
  ┌──┴──┐
  │ Box │ ← Wind
  └──┬──┘
     ↓ Gravity
```

If **ΣF = 0**, no change in velocity!

</div>

</div>

---

<!-- _class: physics -->

# ⚙️ Calculating Force & Acceleration

<div style="text-align: center; margin: 30px;">

<div style="font-size: 2em; background: rgba(0,0,0,0.4); padding: 30px; border-radius: 15px; display: inline-block;">

## **F = ma**

</div>

</div>

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px; margin-top: 30px;">

<div>

- **F** = Force (Newtons)
- **m** = mass (kg)
- **a** = acceleration (m/s²)

</div>

<div class="diagram-box">

### 🚤 Example
Boat: **2000 kg**
Acceleration: **1.5 m/s²**

`F = 2000 × 1.5`
**= 3000 N** 💪

</div>

</div>

---

<!-- _class: concepts -->

# 📚 Equations Summary

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 1.2em;">

<div style="background: rgba(255,255,255,0.2); padding: 20px; border-radius: 10px;">

### 🎯 Key Formulas

- `F = Ma`
- `a = Δv/Δt`
- `v = Δx/Δt`

</div>

<div style="background: rgba(255,255,255,0.2); padding: 20px; border-radius: 10px;">

### 📊 Movement

- `Δx = v Δt`
- `Δx = u Δt + ½a Δt²`

</div>

</div>

---

<!-- _class: code -->

# 💻 Example 1: Moving to Destination

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

<div>

```gdscript
var dest = Vector3(20, 5, 20)
var to_dest = dest - global_position

if to_dest.length() > 0.1:
    to_dest = to_dest.normalized()
    var speed = 5.0
    global_position += \
        to_dest * speed * delta
    look_at(dest, Vector3.UP)
```

</div>

<div>

### 🎮 Better Godot Way

```gdscript
# Simple & clean!
look_at(dest, Vector3.UP)
translate(
    Vector3.FORWARD * 
    speed * delta
)
```

```
     dest •
         ↗
        /
       /
      • object
```

</div>

</div>

---

<!-- _class: code -->

# ⚡ Example 2: Physics Integration

```gdscript
var acceleration = force / mass
velocity += acceleration * delta
global_position += velocity * delta
force = Vector3.ZERO

if velocity.length() > 0.01:
    look_at(global_position + velocity, Vector3.UP)

velocity *= 0.99  # damping - friction effect
```

<div style="background: rgba(255,255,255,0.2); padding: 15px; border-radius: 10px; margin-top: 20px;">

**✨ This implements Newton's laws directly in your game!**

</div>

---

<!-- _class: concepts -->

# 🎯 Seek Behavior

<div style="display: grid; grid-template-columns: 1.3fr 1fr; gap: 25px;">

<div>

### Steering toward target

```gdscript
var desired_velocity = \
    target_pos - global_position

desired_velocity = \
    desired_velocity.normalized()

desired_velocity *= max_speed

var steering_force = \
    desired_velocity - velocity

return steering_force
```

</div>

<div>

```
  Target •
        ↗ desired velocity
       /
      /  
     • ──→ current velocity
   Agent
     
   steering force = 
   desired - current
```

Used for AI movement! 🤖

</div>

</div>

---

# 3D Physics in Godot

## Topics Covered

- Physics recap
- Equations of motion (movement & rotation)
- Physics Engines
- RigidBody3D
- CollisionShape3D
- Joints
- Raycasting
- Practical examples

---

# Torque

The measure of force applied to produce rotational motion

- `torque = position × force`
- Torque = position (relative to centre of gravity) crossed with force
- Torque is a vector
- Magnitude = amount of torque
- Direction = axis of rotation

---

# Angular Velocity & Acceleration

**Angular Velocity**
- Rate at which a body rotates
- Example: Earth rotates at 15 degrees per hour
- Given as a vector

**Angular Acceleration**
- Rate of change of angular velocity over time
- Measured in radians per second² (rad/s²)
- Denoted by Greek letter α
- Also a vector

---

# Inertia

The property of a body which resists change in its motion

**Inertial Tensor**
- A matrix describing how mass is distributed around a shape
- Different for different geometric primitives
- You can approximate complex shapes with simple ones
- Will anyone notice the approximation? Usually not!

---

# Equations of Motion for Rotation

- Torque = `position × force`
- Angular acceleration = `torque * (1 / inertial_tensor)`
- Angular velocity = `angular_velocity + angular_acceleration * time`
- Orientation = `orientation + (time/2) * w * orientation`
  - Where w = pure quaternion of the angular velocity

Simple, isn't it! 😅

---

# Two Ways of Adding Force

**1. Add force at centre of mass**
- Doesn't generate any torque
- Just updates force accumulator
- Movement only

**2. Add force at a point on the object**
- May generate torque
- Updates force accumulator
- AND updates torque accumulator
- Movement and rotation

---

<!-- _class: concepts -->

# ⚙️ Physics Engines

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

<div style="background: rgba(255,255,255,0.15); padding: 15px; border-radius: 10px;">

### 🎯 What They Simulate

🔷 **Rigid body dynamics**
🎯 **Collision detection**
🧣 **Soft body dynamics**
💧 **Fluid dynamics**
⚡ **Real-time** (speed over accuracy)

</div>

<div style="background: rgba(255,255,255,0.15); padding: 15px; border-radius: 10px;">

### 🏆 Major Players

- **Jolt Physics** ⭐ (Godot 4.x!)
- **Bullet** (Godot 3.x)
- **PhysX** (NVIDIA/Unreal)
- **Havok** (commercial)
- **Box2D** (2D physics)

</div>

</div>

---

<!-- _class: physics -->

# 🎯 RigidBody3D Properties

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

<div>

### 🔒 Constant
- ⚖️ Mass
- 📐 Inertial tensor

### 🔄 Changes Over Time
- 📍 Position vector
- ➡️ Linear velocity
- 🔄 Orientation (quaternion)
- 🌀 Angular velocity

</div>

<div>

### 🧮 Calculated Each Frame
- 💪 Force accumulator
- 🔄 Torque accumulator
- ⚡ Acceleration

```
  ┌─────────────┐
  │ RigidBody3D │
  ├─────────────┤
  │ mass: 10.0  │
  │ velocity: →  │
  └─────────────┘
```

</div>

</div>

---

<!-- _class: code -->

# 💻 RigidBody3D in Godot

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

<div>

### 📊 Key Properties
```gdscript
mass
linear_velocity
angular_velocity
inertia
gravity_scale
```

</div>

<div>

### ⚡ Key Methods
```gdscript
apply_force(force, pos)
apply_central_force(force)
apply_torque(torque)
apply_impulse(impulse, pos)
apply_central_impulse(impulse)
```

</div>

</div>

---

<!-- _class: concepts -->

# 🎭 RigidBody3D Types

<div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 15px; font-size: 0.95em;">

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 20px; border-radius: 10px;">

### ⚡ Dynamic

```
   ┌─────┐
   │ ⚖️  │
   └─────┘
     ↓ Falls
```

- Positive mass
- Affected by forces
- Full simulation

</div>

<div style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 20px; border-radius: 10px;">

### 🧱 Static

```
 ═══════════
   Ground
```

- Zero mass
- Cannot move
- Others collide
- Walls, floors

</div>

<div style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 20px; border-radius: 10px;">

### 🎮 Kinematic

```
   ┌─────┐
   │ 🎯  │ ← Controlled
   └─────┘
```

- Code controlled
- Not affected by forces
- Affects others
- Platforms

</div>

</div>

---

<!-- _class: physics -->

# 🔲 CollisionShape3D

<div style="display: grid; grid-template-columns: 1.3fr 1fr; gap: 20px;">

<div>

### Works with RigidBody3D

✅ Collision detection
✅ Trigger areas
✅ Raycasting
✅ Can differ from visual mesh

**Lower resolution = better performance!** 🚀

</div>

<div class="diagram-box">

### Common Shapes

🔴 **SphereShape3D**
📦 **BoxShape3D**
💊 **CapsuleShape3D**
🌭 **CylinderShape3D**
🔺 **ConvexPolygon**
🗻 **ConcavePolygon**

</div>

</div>

```
Visual Mesh (detailed)     Collision Shape (simple)
    ╔═══╗                      ┌───┐
   ╔╝   ╚╗                     │   │  (Much faster!)
   ║     ║                     └───┘
   ╚╗   ╔╝                        
    ╚═══╝                         
```

---

<!-- _class: code -->

# 📡 Collision Signals

```gdscript
# Connect these signals for collision detection

func _on_body_entered(body):
    print("💥 Started touching: ", body.name)
    # Apply damage, play sound, etc.

func _on_body_exited(body):
    print("👋 Stopped touching: ", body.name)
    # Clean up, stop effects, etc.
```

### 🎯 Area3D for Triggers

```gdscript
func _on_area_entered(area):
    print("🚪 Entered trigger zone!")
    # Open door, spawn enemies, save checkpoint
```

---

<!-- _class: code -->

# 💻 Creating RigidBodies in Code

<div style="display: grid; grid-template-columns: 1.2fr 1fr; gap: 15px;">

<div style="font-size: 0.85em;">

```gdscript
func create_brick(pos: Vector3, 
                  scale_vec: Vector3 = Vector3.ONE):
    # Create RigidBody as root
    var rigid_body = RigidBody3D.new()
    rigid_body.position = pos
    rigid_body.mass = 1.0
    add_child(rigid_body)
    
    # Add visual mesh as child
    var mesh_instance = MeshInstance3D.new()
    mesh_instance.mesh = BoxMesh.new()
    mesh_instance.scale = scale_vec
    rigid_body.add_child(mesh_instance)
    
    # Add collision shape as child
    var collision = CollisionShape3D.new()
    collision.shape = BoxShape3D.new()
    rigid_body.add_child(collision)
    
    return rigid_body
```

</div>

<div style="font-size: 0.9em;">

### 🌳 Node Hierarchy

```
RigidBody3D (root)
├─ MeshInstance3D
└─ CollisionShape3D
```

**Key:** RigidBody is the parent!

</div>

</div>

---

<!-- _class: code -->

# 🎡 Creating Cylinders (Wheels)

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

<div>

```gdscript
func create_wheel(
    pos: Vector3, 
    diameter: float, 
    width: float
):
    # RigidBody as root
    var rigid_body = RigidBody3D.new()
    rigid_body.position = pos
    add_child(rigid_body)
    
    # Mesh as child
    var mesh_instance = MeshInstance3D.new()
    var cylinder_mesh = CylinderMesh.new()
    cylinder_mesh.height = width
    cylinder_mesh.top_radius = diameter / 2
    cylinder_mesh.bottom_radius = diameter / 2
    mesh_instance.mesh = cylinder_mesh
    mesh_instance.rotation_degrees = \
        Vector3(0, 0, 90)
    rigid_body.add_child(mesh_instance)
    
    return rigid_body
```

</div>

<div>

### 🔄 Rotation Needed!

```
Default (vertical):
    ═══
    ║ ║
    ║ ║
    ═══

Rotated 90° (horizontal):
    ╔═══════╗
    ║       ║
    ╚═══════╝
    ← Wheel! 🎡
```

</div>

</div>

---

<!-- _class: concepts -->

# 🔗 Joints in Godot

<div style="font-size: 1.1em;">

Nodes that constrain RigidBody3D movement relative to each other

</div>

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 20px; font-size: 0.9em;">

<div style="background: rgba(255,255,255,0.15); padding: 15px; border-radius: 10px;">

📌 **PinJoint3D**
Point-to-point connection

🚪 **HingeJoint3D**
Rotation around axis

</div>

<div style="background: rgba(255,255,255,0.15); padding: 15px; border-radius: 10px;">

↔️ **SliderJoint3D**
Movement along axis

🎯 **Generic6DOF**
Configure everything!

</div>

</div>

All joints have `node_a`, `node_b`, and `breaking` threshold

---

<!-- _class: physics -->

# 🚪 HingeJoint3D - Doors & Wheels

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">

<div>

```gdscript
var hinge = HingeJoint3D.new()
add_child(hinge)

hinge.node_a = wheel.get_path()
hinge.node_b = chassis.get_path()

# Optional: add motor
hinge.set_flag(
    HingeJoint3D.FLAG_ENABLE_MOTOR, 
    true
)
hinge.set_param(
    HingeJoint3D.PARAM_MOTOR_TARGET_VELOCITY,
    10.0
)
```

</div>

<div>

### 🚗 Perfect For:

```
    Wheel         Door
   ═══╪═══      ┃   │
   ═══╪═══      ┃   │
      ↕           ↺
   Chassis     Hinges
```

**Axis of rotation** is key! 🔑

</div>

</div>

---

<!-- _class: physics -->

# ↔️ SliderJoint3D - Linear Motion

<div style="display: grid; grid-template-columns: 1.2fr 1fr; gap: 25px;">

<div>

```gdscript
var slider = SliderJoint3D.new()
add_child(slider)

slider.node_a = piston.get_path()
slider.node_b = cylinder.get_path()

# Set movement limits
slider.set_param(
    SliderJoint3D.PARAM_LINEAR_LIMIT_UPPER, 
    5.0
)
slider.set_param(
    SliderJoint3D.PARAM_LINEAR_LIMIT_LOWER, 
    -5.0
)
```

</div>

<div>

### 🔧 Piston Example

```
  ┌────┐
  │    │──────┐
  │    │←→→→  │
  └────┘──────┘
  
  Moves along
  single axis!
```

Sliding doors, drawers, pistons 🚀

</div>

</div>

---

<!-- _class: physics -->

# 📌 PinJoint3D - Chains & Ropes

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">

<div>

```gdscript
var pin = PinJoint3D.new()
add_child(pin)

pin.node_a = object_a.get_path()
pin.node_b = object_b.get_path()

# Add damping for stability
pin.set_param(
    PinJoint3D.PARAM_BIAS, 
    0.3
)
pin.set_param(
    PinJoint3D.PARAM_DAMPING, 
    1.0
)
```

</div>

<div class="diagram-box">

### ⛓️ Use Cases

```
  ●───●───●───●
  Chain links

  ●
  │
  ●  Wrecking ball
  │
  🏗️

  🙍‍♂️  Ragdoll
  ◯╪◯  physics
   ╱╲
```

</div>

</div>

---

<!-- _class: concepts -->

# 🎯 Generic6DOFJoint3D

<div style="font-size: 1.1em; background: rgba(255,255,255,0.2); padding: 25px; border-radius: 15px;">

### Most Flexible Joint - Configure Everything!

**Six Degrees of Freedom:**
- 3 Linear (X, Y, Z movement)
- 3 Angular (X, Y, Z rotation)

Each axis can be:
- 🔒 Locked
- 🔓 Free
- ⚙️ Limited
- 🔄 Motorized
- 🌊 Spring-damped

</div>

<div style="text-align: center; margin-top: 20px; font-size: 1.2em;">

Use when other joints don't fit your needs! 🛠️

</div>

---

<!-- _class: title -->

# 📡 Raycasting

<div style="font-size: 1.4em; margin-top: 40px;">

Laser-precise collision detection! 🎯

</div>

---

<!-- _class: physics -->

# 📡 Raycasting in Godot

<div style="display: grid; grid-template-columns: 1.2fr 1fr; gap: 25px;">

<div>

### What is it?

A **ray** from origin to target

Returns collision information:
- 📍 Hit position
- 🎯 Hit object
- 📐 Surface normal
- 📏 Distance

**Very efficient!** Hundreds per frame 🚀

</div>

<div>

### 📊 Visualization

```
  Camera 📷
    |
    |  Ray
    ↓
    ·
    ·
    ·
  ╔═══════════╗
  ║   Wall    ║
  ║     • Hit ║
  ╚═══════════╝
```

</div>

</div>

---

<!-- _class: code -->

# 💻 Raycasting Code

```gdscript
var space_state = get_world_3d().direct_space_state
var query = PhysicsRayQueryParameters3D.create(origin, target)
var result = space_state.intersect_ray(query)

if result:
    print("🎯 Hit: ", result.collider.name)
    print("📍 Position: ", result.position)
    print("📐 Normal: ", result.normal)
    
    # Spawn effect at hit point
    spawn_explosion(result.position)
```

<div style="background: rgba(255,255,255,0.2); padding: 15px; border-radius: 10px; margin-top: 20px;">

💡 **Use cases:** Line of sight, shooting, object placement, mouse picking!

</div>

---

<!-- _class: code -->

# 🖱️ Raycasting from Camera

<div style="font-size: 0.85em;">

```gdscript
var camera = get_viewport().get_camera_3d()
var mouse_pos = get_viewport().get_mouse_position()

# Get ray from camera through mouse position
var from = camera.project_ray_origin(mouse_pos)
var to = from + camera.project_ray_normal(mouse_pos) * 1000

var space_state = get_world_3d().direct_space_state
var query = PhysicsRayQueryParameters3D.create(from, to)
var result = space_state.intersect_ray(query)

if result:
    spawn_object(result.position)  # Click to place!
```

</div>

```
    Screen          3D World
  ┌─────────┐        ╱      Ray through
  │  🖱️     │   📷 ╱       mouse position
  │    •    │     ╱   
  └─────────┘    •────────→ • Hit!
```

---

<!-- _class: title -->

# 🔫 Gravity Gun

<div style="font-size: 1.3em; margin-top: 30px;">

Half-Life 2's iconic physics manipulator!

</div>

---

<!-- _class: concepts -->

# 🎮 Gravity Gun Concept

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">

<div>

### 💡 The Idea

Players directly manipulate physics objects

Use them as:
- 🎯 Projectiles
- 🛡️ Shields
- 🧩 Puzzle solutions
- ⚙️ Tools

</div>

<div class="diagram-box">

### 🎬 Famous Examples

- **Half-Life 2** (original!)
- Portal
- BioShock
- Crysis
- Dead Space

</div>

</div>

```
  📷 Player         🔫 Gravity Gun         📦 Object
     ╲                    |                  /
      ╲                   |                 /
       ╲                  ↓                /
        ╲         💫 Pick up!             /
         ╲________________________________/
```

---

<!-- _class: physics -->

# 🔫 Gravity Gun - Algorithm

<div style="font-size: 0.95em;">

### 1️⃣ **Check for Input** (mouse click)

### 2️⃣ **If Nothing Picked Up:**
   - Raycast from camera → If hit valid object → pick it up!

### 3️⃣ **If Something Held:**
   - Calculate hold position (in front of camera)
   - Calculate velocity toward hold position
   - Apply velocity to object's RigidBody3D

### 4️⃣ **On Release:**
   - Drop the object (set `picked_up = null`)

</div>

---

<!-- _class: code -->

# 📝 Gravity Gun - Pseudocode

```
if mouse_clicked:
    if picked_up == null:
        ┌─────────────────────────────┐
        │ Raycast from camera         │
        │ if hit_object and not world:│
        │     picked_up = hit_object  │
        └─────────────────────────────┘
    else:
        ┌──────────────────────────────────────┐
        │ hold_pos = camera + forward * dist   │
        │ direction = hold_pos - picked_pos    │
        │ velocity = direction * power         │
        │ velocity = clamp(velocity, max_vel)  │
        │ picked_up.linear_velocity = velocity │
        └──────────────────────────────────────┘
else:
    picked_up = null  # Drop it!
```

---

<!-- _class: code -->

# 💻 Gravity Gun - Setup

```gdscript
extends Node3D

var picked_up = null
var hold_distance = 5.0
var power_factor = 10.0
var max_velocity = 20.0

func _process(delta):
    if Input.is_action_pressed("shoot"):
        if picked_up == null:
            raycast_and_pickup()
        else:
            hold_object()
    else:
        picked_up = null  # Release
```

---

<!-- _class: code -->

# 🎯 Raycast & Pickup

<div style="font-size: 0.85em;">

```gdscript
func raycast_and_pickup():
    var camera = get_viewport().get_camera_3d()
    var from = camera.global_position
    var to = from + camera.global_transform.basis.z * -100
    
    var space_state = get_world_3d().direct_space_state
    var query = PhysicsRayQueryParameters3D.create(from, to)
    var result = space_state.intersect_ray(query)
    
    if result:
        var hit_object = result.collider
        # Only pick up RigidBody3D objects
        if hit_object is RigidBody3D and hit_object.name != "Ground":
            picked_up = hit_object
            print("📦 Picked up: ", hit_object.name)
```

</div>

---

<!-- _class: code -->

# 🎪 Hold Object

<div style="font-size: 0.85em;">

```gdscript
func hold_object():
    var camera = get_viewport().get_camera_3d()
    
    # Calculate position in front of camera
    var hold_pos = camera.global_position + \
                   camera.global_transform.basis.z * -hold_distance
    
    # Calculate velocity to move object to hold position
    var to_hold_pos = hold_pos - picked_up.global_position
    to_hold_pos *= power_factor
    
    # Clamp to maximum velocity
    if to_hold_pos.length() > max_velocity:
        to_hold_pos = to_hold_pos.normalized() * max_velocity
    
    # Apply the velocity
    picked_up.linear_velocity = to_hold_pos
```

</div>

---

<!-- _class: physics -->

# 🔧 Physics Integration in Code

<div style="font-size: 0.95em;">

```gdscript
# Newtonian Physics (Linear Motion)
var acceleration = force / mass
velocity += acceleration * delta
position += velocity * delta
velocity *= 0.99  # damping/friction

# Hamiltonian Physics (Rotational Motion)
var angular_acceleration = torque / inertia
angular_velocity += angular_acceleration * delta
# Godot handles quaternion rotation automatically!

# Reset force accumulators
force = Vector3.ZERO
torque = Vector3.ZERO
```

</div>

<div style="background: rgba(255,255,255,0.2); padding: 15px; border-radius: 10px; margin-top: 15px;">

⚡ **Godot's physics engine does this for you automatically!**

</div>

---

<!-- _class: concepts -->

# 🎓 Advanced Integration

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">

<div>

### ⚡ Explicit Euler (Current)

What we've been using:
```
Simple & fast
One step per frame
```

Good for most games! ✅

</div>

<div>

### 🎯 Runge-Kutta (RK4)

More accurate:
```
4 samples per timestep
t = 0, 0.25, 0.5, 0.75
Final value at t = 1
```

Better stability 🎯

</div>

</div>

<div style="background: rgba(255,255,255,0.2); padding: 15px; border-radius: 10px; margin-top: 15px; text-align: center;">

**Good news:** Godot's physics engine handles this automatically! 🎉

</div>

---

<!-- _class: title -->

# 🎓 Lab Exercises

<div style="font-size: 1.2em; margin-top: 30px;">

Time to practice! 💪

</div>

---

<!-- _class: physics -->

# 🏗️ Lab Exercises

<div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 15px; font-size: 0.9em;">

<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 15px; border-radius: 10px;">

### 1️⃣ Tower Builder

```
    ▭
   ▭▭▭
  ▭▭▭▭▭
 ▭▭▭▭▭▭▭
```

- Stack blocks
- Destroy mechanic
- Make it fun!

</div>

<div style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); padding: 15px; border-radius: 10px;">

### 2️⃣ Simple Car

```
  ┌─────┐
  │     │
  └○───○┘
```

- Chassis + wheels
- HingeJoint3D
- Motor controls
- Drive it!

</div>

<div style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); padding: 15px; border-radius: 10px;">

### 3️⃣ Physics Gun

```
  📷 → 📦
```

- Gravity gun
- Throw mechanic
- Tune power
- Have fun!

</div>

</div>

---

<!-- _class: concepts -->

# 📚 Recap - What We Learned

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 1.1em;">

<div style="background: rgba(255,255,255,0.15); padding: 20px; border-radius: 10px;">

### 🎯 Core Concepts

✅ Newtonian physics
✅ Forces & acceleration
✅ Velocity & position
✅ Torque & rotation
✅ Angular motion

</div>

<div style="background: rgba(255,255,255,0.15); padding: 20px; border-radius: 10px;">

### 🔧 Godot Tools

✅ RigidBody3D
✅ CollisionShape3D
✅ Joints (all types!)
✅ Raycasting
✅ Physics integration

</div>

</div>

---

<!-- _class: physics -->

# 🎯 Quick Reference

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 0.95em;">

<div>

### 📊 Key Formulas
```
F = ma
v = v₀ + at
x = x₀ + v₀t + ½at²
τ = r × F
```

</div>

<div>

### 🔧 Joint Types
- 📌 PinJoint3D → chains
- 🚪 HingeJoint3D → doors/wheels  
- ↔️ SliderJoint3D → pistons
- 🎯 Generic6DOF → custom

</div>

</div>

---

<!-- _class: code -->

# 🌐 Resources & Links

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 25px;">

<div style="background: rgba(255,255,255,0.2); padding: 20px; border-radius: 10px;">

### 📖 Official Docs

🔗 **Godot Physics**
docs.godotengine.org/physics

🔗 **RigidBody3D**
docs.godotengine.org/rigidbody3d

🔗 **Joints**
docs.godotengine.org/joints

</div>

<div style="background: rgba(255,255,255,0.2); padding: 20px; border-radius: 10px;">

### 🎬 Learning Resources

🎓 **GDQuest**
gdquest.com

🎓 **Godot Tutorials**
godottutorials.com

🎓 **Game Dev Academy**
gamedevacademy.org

</div>

</div>

---

<!-- _class: title -->

# 🎉 Questions?

<div style="margin-top: 60px; font-size: 1.3em;">

Thanks for your attention!

<br>

</div>

<div style="margin-top: 60px; font-size: 1.5em;">

Now go build something awesome! 🚀

</div>