# GPUParticles3D Tutorial - Godot 4

A complete guide to creating particle effects using GPUParticles3D in Godot Engine.

## What is GPUParticles3D?

GPUParticles3D is a node that creates particle effects rendered by the GPU. It's fast, efficient, and perfect for effects like fire, smoke, rain, explosions, magic spells, and more.

**GPUParticles3D vs CPUParticles3D:**
- **GPUParticles3D**: Faster, more particles, uses GPU, more features
- **CPUParticles3D**: Slower, fewer particles, uses CPU, simpler, better for low-end devices

## Basic Setup

### Step 1: Create the Node

1. Add a `GPUParticles3D` node to your scene
2. You'll see a warning: "Nothing is visible because no material has been assigned"

### Step 2: Create a Process Material

The Process Material controls how particles behave (physics, movement, lifetime).

1. In the Inspector, find **Process Material**
2. Click the dropdown → **New ParticleProcessMaterial**
3. Click the material to edit it

### Step 3: Create a Draw Pass

The Draw Pass determines what each particle looks like.

1. Find **Draw Passes** → **Pass 1**
2. Click dropdown → **New QuadMesh** (most common for particles)
3. You should now see white particles!

## Complete Property Reference

### GPUParticles3D Node Properties

#### Time Properties

**Emitting**: `bool`
- Turns particle emission on/off
- When false, existing particles continue but no new ones spawn

**Amount**: `int` (1-1000000)
- Total number of particles that can exist simultaneously
- Higher values = more GPU/memory usage
- Typical range: 50-500 for most effects

**Lifetime**: `float` (seconds)
- How long each particle exists before disappearing
- Controls duration of particle effect
- Example: 2.0 = each particle lives 2 seconds

**One Shot**: `bool`
- True: Emits all particles once, then stops
- False: Continuously emits particles
- Perfect for explosions, impacts, single events

**Preprocess**: `float` (seconds)
- Simulates particles for X seconds before becoming visible
- Useful so particles already exist when scene loads
- Example: 1.0 = particles pre-simulated for 1 second

**Speed Scale**: `float`
- Multiplier for simulation speed
- 1.0 = normal speed
- 2.0 = double speed, 0.5 = half speed
- 0.0 = pauses simulation

**Explosiveness**: `float` (0.0 - 1.0)
- 0.0 = Particles emit evenly over lifetime
- 1.0 = All particles emit instantly (explosion burst)
- 0.5 = Half emit instantly, half over time

**Randomness**: `float` (0.0 - 1.0)
- Adds random delay to particle emission
- 0.0 = predictable timing
- 1.0 = maximum randomness in emission timing

**Fixed FPS**: `int`
- Locks particle simulation to specific framerate
- 0 = matches game FPS (default)
- 30 = simulates at 30 FPS regardless of game speed
- Useful for consistent behavior across different hardware

**Interpolate**: `bool`
- Smooths particle movement between Fixed FPS updates
- Only relevant when Fixed FPS > 0
- Reduces stuttering on high refresh rate displays

**Fract Delta**: `bool`
- Advanced timing option for sub-frame accuracy
- Usually leave as default (false)

#### Collision Properties

**Collision Base Size**: `float`
- Size multiplier for particle collision detection
- Only matters if using collision in Process Material

#### Drawing Properties

**Draw Order**: `enum`
- **Index**: Emission order (first emitted = drawn first)
- **Lifetime**: Older particles drawn first
- **Reverse Lifetime**: Newer particles drawn first
- **View Depth**: Sorted by distance from camera

**Transform Align**: `enum`
- **Disabled**: Particles use their own rotation
- **Z-Billboard**: Face camera, can rotate around view axis
- **Y to Velocity**: Align Y axis to movement direction
- **Z-Billboard + Y to Velocity**: Combine both

#### Trail Properties

**Trail Enabled**: `bool`
- Creates trails behind particles
- Like motion blur or ribbon effect

**Trail Lifetime**: `float` (seconds)
- How long trail segments persist
- Shorter = tighter trails
- Longer = longer, more visible trails

**Trail Sections**: `int`
- Number of segments in trail
- More = smoother but more performance cost
- Typical: 4-8 sections

**Trail Section Subdivisions**: `int`
- Smoothness of each section
- Higher = rounder trails but more GPU usage

#### Visibility

**Visibility AABB**: `AABB` (Axis-Aligned Bounding Box)
- Defines region where particles can exist
- If particles leave this box, they may cull incorrectly
- Auto-calculated but can override manually

### ParticleProcessMaterial Properties

The Process Material controls particle physics and behavior.

---

#### EMISSION Section

Controls where and how particles spawn.

**Emission Shape**: `enum`
- **Point**: Single point (simplest)
- **Sphere**: Random points inside/on sphere
- **Sphere Surface**: Only on sphere surface
- **Box**: Random points in box volume
- **Points**: Emit from specific point list
- **Directed Points**: Points with directions
- **Ring**: Circle/torus shape

**Emission Sphere Radius**: `float`
- Radius of sphere emission shape
- Only visible when Emission Shape = Sphere/Sphere Surface

**Emission Box Extents**: `Vector3`
- Half-size of box (full size = extents × 2)
- Example: (5, 1, 5) = 10×2×10 box
- Only visible when Emission Shape = Box

**Emission Ring Axis**: `Vector3`
- Direction ring faces
- Only for Ring emission shape

**Emission Ring Height**: `float`
- Thickness of ring (for torus)
- 0 = flat circle

**Emission Ring Radius**: `float`
- Radius of ring
- Only for Ring emission shape

**Emission Ring Inner Radius**: `float`
- Creates donut shape
- 0 = solid disk

**Emission Point Texture**: `Texture2D`
- Image where bright pixels = spawn points
- For Points/Directed Points emission

**Emission Point Count**: `int`
- Number of points to sample from texture
- For Points/Directed Points emission

**Emission Normal Texture**: `Texture2D`
- Defines emission directions from texture
- For Directed Points emission

**Emission Color Texture**: `Texture2D`
- Sets initial particle colors from texture

---

#### PARTICLE FLAGS Section

**Align Y to Velocity**: `bool`
- Rotates particle Y axis toward movement direction
- Great for sparks, projectiles, rain

**Rotate Y**: `bool`
- Allows rotation around Y axis
- Disable to prevent spinning on one axis

**Disable Z**: `bool`
- Locks particles to 2D plane (XY only)
- For 2.5D effects in 3D scene

---

#### DIRECTION Section

Controls initial particle movement.

**Direction**: `Vector3`
- Base direction particles move
- Example: (0, 1, 0) = upward
- (0, -1, 0) = downward
- Usually normalized (length = 1)

**Spread**: `float` (degrees, 0-180)
- Cone angle of dispersion from Direction
- 0 = straight line
- 45 = narrow cone
- 180 = full hemisphere

**Flatness**: `float` (0.0 - 1.0)
- Flattens spread into disk shape
- 0.0 = spherical spread (cone)
- 1.0 = flat disk spread
- Useful for ground impacts, magic circles

---

#### GRAVITY Section

**Gravity**: `Vector3`
- Constant acceleration applied to particles
- Example: (0, -9.8, 0) = realistic gravity
- (0, 5, 0) = upward force (fire, bubbles)
- Can point any direction

---

#### INITIAL VELOCITY Section

**Velocity Min**: `float`
- Minimum starting speed
- Units per second

**Velocity Max**: `float`
- Maximum starting speed
- Each particle gets random value between min and max

---

#### ANGULAR VELOCITY Section

Controls particle spinning.

**Angular Velocity Min**: `float` (degrees/second)
- Minimum rotation speed
- Can be negative for counter-clockwise

**Angular Velocity Max**: `float` (degrees/second)
- Maximum rotation speed
- Random value chosen between min and max

**Angular Velocity Curve**: `CurveTexture`
- Changes rotation speed over particle lifetime
- Y axis = speed multiplier, X axis = lifetime (0-1)

---

#### ORBIT VELOCITY Section

Makes particles orbit around spawn point.

**Orbit Velocity Min**: `float`
- Minimum orbital rotation speed

**Orbit Velocity Max**: `float`
- Maximum orbital rotation speed

**Orbit Velocity Curve**: `CurveTexture`
- Changes orbital speed over lifetime

---

#### LINEAR ACCEL Section

Acceleration along movement direction.

**Linear Accel Min**: `float`
- Minimum acceleration (speeds up or slows down)
- Positive = accelerate, negative = decelerate

**Linear Accel Max**: `float`
- Maximum acceleration

**Linear Accel Curve**: `CurveTexture`
- Changes acceleration over lifetime

---

#### RADIAL ACCEL Section

Acceleration toward/away from origin.

**Radial Accel Min**: `float`
- Positive = push away from center (explosion)
- Negative = pull toward center (vortex)

**Radial Accel Max**: `float`
- Maximum radial acceleration

**Radial Accel Curve**: `CurveTexture`
- Changes radial force over lifetime

---

#### TANGENTIAL ACCEL Section

Acceleration perpendicular to radial direction (creates spirals).

**Tangential Accel Min**: `float`
- Minimum tangential force
- Creates swirling, spiral motion

**Tangential Accel Max**: `float`
- Maximum tangential force

**Tangential Accel Curve**: `CurveTexture`
- Changes swirl over lifetime

---

#### DAMPING Section

Friction that slows particles over time.

**Damping Min**: `float`
- Minimum damping force
- Higher = more friction

**Damping Max**: `float`
- Maximum damping force

**Damping Curve**: `CurveTexture`
- Changes damping over lifetime
- Great for particles that slow down gradually

---

#### ANGLE Section

Initial rotation of particles.

**Angle Min**: `float` (degrees)
- Minimum starting rotation angle

**Angle Max**: `float` (degrees)
- Maximum starting rotation angle
- Random value chosen between min/max

**Angle Curve**: `CurveTexture`
- Changes angle over lifetime

---

#### SCALE Section

Size of particles.

**Scale Min**: `float`
- Minimum particle size
- 1.0 = original mesh size

**Scale Max**: `float`
- Maximum particle size

**Scale Curve**: `CurveTexture`
- Changes size over lifetime
- Very useful for grow/shrink effects
- Common pattern: grow quickly, then fade

**Scale Over Velocity Min**: `float`
- Scales particle based on speed
- Faster particles = different size

**Scale Over Velocity Max**: `float`
- Maximum velocity-based scaling

---

#### COLOR Section

Particle colors and transparency.

**Color**: `Color`
- Base color of all particles
- RGBA (includes alpha for transparency)

**Color Ramp**: `GradientTexture1D`
- Changes color over particle lifetime
- Left = birth, right = death
- Perfect for fade effects
- Example: White → Transparent for fade out

**Color Initial Ramp**: `GradientTexture1D`
- Random starting color picked from gradient
- Adds color variety to particles

---

#### HUE VARIATION Section

Random hue shifts for color variety.

**Hue Variation Min**: `float` (-1.0 to 1.0)
- Minimum hue shift
- 0 = no change, 0.5 = opposite color

**Hue Variation Max**: `float` (-1.0 to 1.0)
- Maximum hue shift

**Hue Variation Curve**: `CurveTexture`
- Changes hue shift over lifetime

---

#### ANIMATION Section

For animated sprite sheets.

**Animation Speed Min**: `float`
- Minimum frames per second of animation

**Animation Speed Max**: `float`
- Maximum animation speed

**Animation Offset Min**: `float`
- Starting frame offset
- For randomizing animation start

**Animation Offset Max**: `float`
- Maximum offset

---

#### TURBULENCE Section

Noise-based random motion (like wind, chaos).

**Turbulence Enabled**: `bool`
- Enables turbulence effect

**Turbulence Noise Strength**: `float`
- How much turbulence affects particles
- Higher = more chaotic movement

**Turbulence Noise Scale**: `float`
- Size of turbulence patterns
- Smaller = rapid changes, larger = slow waves

**Turbulence Noise Speed**: `Vector3`
- Speed turbulence pattern moves
- Creates flowing, animated chaos

**Turbulence Noise Speed Random**: `float` (0-1)
- Randomizes turbulence speed

**Turbulence Influence Min**: `float`
- Minimum turbulence effect strength

**Turbulence Influence Max**: `float`
- Maximum turbulence effect strength

**Turbulence Initial Displacement Min**: `float`
- Starting random offset

**Turbulence Initial Displacement Max**: `float`
- Maximum starting offset

---

#### COLLISION Section

**Collision Mode**: `enum`
- **Disabled**: No collision
- **Rigid**: Bounces off surfaces
- **Hide on Contact**: Disappears on hit

**Collision Friction**: `float`
- How much energy lost on bounce
- 0.0 = slides freely, 1.0 = stops on contact

**Collision Bounce**: `float`
- Bounciness
- 0.0 = no bounce, 1.0 = perfect bounce

**Collision Use Scale**: `bool`
- Whether particle scale affects collision size

---

#### SUB EMITTER Section

Particles that spawn other particles.

**Sub Emitter Mode**: `enum`
- **Disabled**: No sub-emitters
- **Constant**: Emit continuously
- **At End**: Emit when particle dies
- **At Collision**: Emit on collision

**Sub Emitter Frequency**: `float`
- How often sub-particles spawn (if constant mode)

**Sub Emitter Amount at End**: `int`
- Number of particles spawned when parent dies

**Sub Emitter Keep Velocity**: `bool`
- Sub-particles inherit parent velocity

---

#### ATTRACTOR INTERACTION Section

**Attractor Interaction Enabled**: `bool`
- Allows GPUParticlesAttractor3D nodes to affect these particles

---

### Draw Pass Properties

The Draw Pass defines what each particle looks like visually.

#### Pass 1, 2, 3, 4

You can have up to 4 draw passes (layered meshes per particle).

**Common Mesh Types:**

**QuadMesh**: 
- Flat square facing camera
- Most common for particles
- Best for sprites, textures

**SphereMesh**:
- 3D sphere
- For bubbles, orbs, planets

**BoxMesh**:
- 3D cube
- For debris, blocks

**CylinderMesh**:
- For pillars, beams

**Custom Mesh**:
- Import your own .obj, .gltf, etc.
- For unique particle shapes

#### Material (on the Mesh)

Usually a **StandardMaterial3D**:

**Albedo → Texture**: 
- The sprite/image for particle
- Alpha channel controls transparency

**Transparency → Alpha/Alpha Scissor**:
- Alpha: Smooth transparency (most common)
- Alpha Scissor: Hard-edged cutout

**Blend Mode**:
- **Mix**: Normal blending
- **Add**: Additive (glowing effect, particles brighten each other)
- **Sub**: Subtractive (darkening)
- **Mul**: Multiplicative

**Shading → Unshaded**:
- Disable lighting for consistent brightness
- Most particles use this

**Billboard → Enabled**:
- Particle always faces camera
- Essential for flat particles (quads)

**Particles Anim → H Frames / V Frames**:
- For sprite sheet animations
- H Frames = columns, V Frames = rows
- Example: 4×4 sprite sheet = H:4, V:4

**Vertex Color → Use as Albedo**:
- Allows particle color to tint texture
- Usually enabled

---

## Practical Examples

### Example 1: Simple Fire

```
GPUParticles3D Settings:
- Amount: 50
- Lifetime: 1.5
- Explosiveness: 0.0

ParticleProcessMaterial:
Emission:
  - Emission Shape: Sphere
  - Sphere Radius: 0.2
  - Direction: Y (0, 1, 0)
  - Spread: 15
  - Initial Velocity Min: 2
  - Initial Velocity Max: 3

Gravity:
  - Y: 0.5 (rises up)

Scale:
  - Scale Min: 0.3
  - Scale Max: 0.5
  - Scale Curve: Decreasing curve

Color:
  - Color Ramp: Orange → Red → Black (fades out)
```

### Example 2: Rain

```
GPUParticles3D Settings:
- Amount: 500
- Lifetime: 3.0
- Explosiveness: 0.0

ParticleProcessMaterial:
Emission:
  - Emission Shape: Box
  - Box Extents: (10, 0.1, 10)
  - Direction: Y (0, -1, 0)
  - Spread: 0
  - Initial Velocity: 15

Gravity:
  - Y: -20 (falls fast)

Scale:
  - Scale Min: 0.05
  - Scale Max: 0.1
  
Draw Pass:
  - Use a stretched QuadMesh or custom raindrop mesh
```

### Example 3: Explosion

```
GPUParticles3D Settings:
- Amount: 200
- Lifetime: 1.0
- One Shot: true
- Explosiveness: 1.0

ParticleProcessMaterial:
Emission:
  - Emission Shape: Sphere
  - Sphere Radius: 0.1
  - Spread: 180
  - Initial Velocity Min: 5
  - Initial Velocity Max: 10

Gravity:
  - Y: -5

Damping:
  - Damping: 2.0 (slows down quickly)

Scale:
  - Scale Curve: Quick peak then fade

Color:
  - Color Ramp: Bright yellow → Orange → Black
```

## Advanced Features

### Using Textures

To add texture to particles:

1. Create a **StandardMaterial3D** for the QuadMesh
2. Set **Albedo Texture** to your particle texture (sprite)
3. Enable **Transparency** → Alpha
4. Set **Blend Mode** → Add (for glowing effects) or Mix
5. Enable **Billboard** → Enabled (particles always face camera)

### Color Ramp

For fading or color-changing effects:

1. In ParticleProcessMaterial, enable **Color → Color Ramp**
2. Click to create **New GradientTexture1D**
3. Click the Gradient to edit
4. Add color points to create fade effect
   - Example: White (alpha 1) → White (alpha 0) for fade out

### Scale Curve

Control particle size over lifetime:

1. Enable **Scale → Scale Curve**
2. Create **New CurveTexture**
3. Click the Curve to edit
4. Shape curve: Left = birth, Right = death
   - Example: Start small, grow, then shrink

### Trails

Make particles leave trails behind them:

1. In GPUParticles3D, set **Trail Enabled**: true
2. Set **Trail Lifetime**: how long trail lasts (e.g., 0.3)
3. Trail Sections: more = smoother trail

## Performance Tips

1. **Use fewer particles** when possible
2. **Limit Lifetime** - shorter = less particles on screen
3. **Use LOD** - reduce particles at distance
4. **One Shot** - for explosions, don't keep emitting
5. **Fixed FPS** - set to 30 for less frequent updates
6. **Visibility Range** - set max distance in Process Material

## Common Issues

**Particles not visible?**
- Check Draw Pass is set
- Check Process Material is set
- Check Emitting is true
- Move camera to see particles

**Particles too fast/slow?**
- Adjust Initial Velocity
- Adjust Gravity
- Add Damping to slow them down

**Particles look flat?**
- Enable Billboard in material
- Use proper lighting
- Add depth with color/scale curves

## Scripting Particles

```gdscript
extends GPUParticles3D

func _ready():
    # Start emitting
    emitting = true

func explode():
    # One-shot explosion
    one_shot = true
    emitting = true
    restart()

func change_color(new_color: Color):
    var mat = process_material as ParticleProcessMaterial
    mat.color = new_color
```

## Next Steps

- Experiment with different Emission Shapes
- Combine multiple GPUParticles3D for complex effects
- Try Attractors and Collision
- Use SubViewport for texture effects
- Study real-world particle effects for inspiration

Particles are all about experimentation - have fun creating effects!