---
marp: true
theme: default
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
---

# GPUParticles3D in Godot 4

## Complete Guide to Particle Systems

*Creating stunning visual effects with GPU-accelerated particles*

---

## What is GPUParticles3D?

A node that creates particle effects rendered by the **GPU**

**Perfect for:**
- Fire, smoke, explosions
- Rain, snow, weather effects
- Magic spells and energy
- Sparks, debris, impacts
- Trails and atmospheric effects

**Why GPU?** Fast, efficient, can handle thousands of particles

---

## GPUParticles3D vs CPUParticles3D

| GPUParticles3D | CPUParticles3D |
|----------------|----------------|
| ✅ Much faster | ⚠️ Slower |
| ✅ More particles (1000s) | ⚠️ Fewer particles (100s) |
| ✅ More features | ⚠️ Simpler |
| ✅ GPU accelerated | ⚠️ CPU bound |
| ⚠️ Needs decent GPU | ✅ Works on low-end devices |

**Rule of thumb:** Use GPUParticles3D unless targeting very old hardware

---

## Basic Setup - Three Steps

### 1. Add GPUParticles3D Node
Create the node in your scene

### 2. Assign Process Material
Controls particle **behavior** (physics, movement, lifetime)
- Click **Process Material** → **New ParticleProcessMaterial**

### 3. Assign Draw Pass
Controls particle **appearance** (what they look like)
- Click **Draw Passes → Pass 1** → **New QuadMesh**

**You should now see white particles!**

---

## Core GPUParticles3D Properties

### Time Properties

**Emitting** - Turn emission on/off

**Amount** - Total number of particles (50-500 typical)

**Lifetime** - How long each particle exists (seconds)

**One Shot** - Emit once and stop (explosions, impacts)

**Speed Scale** - Simulation speed multiplier (1.0 = normal)

---

## Core Properties (continued)

**Explosiveness** (0.0 - 1.0)
- 0.0 = Emit gradually over time
- 1.0 = Emit all at once (burst effect)

**Randomness** (0.0 - 1.0)
- Adds random delays to emission timing

**Fixed FPS** 
- Lock simulation framerate (0 = match game FPS)
- Use 30 for consistent behavior across hardware

**Preprocess**
- Pre-simulate particles before scene loads
- Particles already exist when visible

---

## Process Material Overview

Controls the **physics and behavior** of particles

**Main categories:**
- Emission (where particles spawn)
- Direction & Spread
- Forces (gravity, acceleration)
- Scale & Color
- Rotation & Animation
- Advanced (turbulence, collision)

Let's explore each section...

---

## Emission Properties

### Emission Shape
Where particles spawn from:
- **Point** - Single location
- **Sphere** - Random points in sphere
- **Box** - Random points in box volume
- **Ring** - Circle/torus shape
- **Points/Directed Points** - Custom locations

### Shape Parameters
- **Sphere Radius** - Size of sphere
- **Box Extents** - Half-size of box (5,1,5 = 10×2×10 box)
- **Ring Radius/Height** - Ring dimensions

---

## Direction & Spread

**Direction** - Base movement direction
- Vector3(0, 1, 0) = Upward
- Vector3(0, -1, 0) = Downward

**Spread** - Cone angle of dispersion (0-180°)
- 0° = Straight line
- 45° = Narrow cone
- 180° = Full hemisphere

**Flatness** (0.0 - 1.0)
- 0.0 = Spherical cone
- 1.0 = Flat disk spread
- Great for ground impacts!

---

## Particle Flags - Critical Settings!

### Align Y to Velocity
- **Rotates particle Y-axis toward movement direction**
- Makes particles "point forward" like arrows
- Essential for: Rain, sparks, bullets, projectiles, streaks

### Rotate Y
- **Allows spinning around Y-axis**
- Enable: Tumbling leaves, spinning coins
- Disable: Particles that shouldn't twist

### Disable Z
- **Locks particles to 2D plane (XY only)**
- Perfect for: 2.5D games, flat UI effects, cartoon-style

---

## Particle Flags - Visual Examples

**Align Y to Velocity:**
```
Rain without: | | | | (all vertical, boring)
Rain with:    \ | / | (angles toward movement!)
```

**Disable Z:**
```
3D particles: Moving in all directions →←↑↓⊙⊗
With Disable Z: Only on flat plane →←↑↓
```

**Pro tip:** Combine Align Y to Velocity with stretched mesh for motion streaks!

---

## Initial Velocity

Controls starting speed of particles

**Velocity Min** - Minimum speed (units/second)

**Velocity Max** - Maximum speed

Each particle gets random value between min and max

**Example:**
- Min: 2, Max: 5
- Some particles move slowly, others quickly
- Creates natural variation

---

## Gravity

**Gravity** - Constant acceleration (Vector3)

**Common patterns:**
- `(0, -9.8, 0)` - Realistic downward gravity
- `(0, 5, 0)` - Upward force (fire, smoke, bubbles)
- `(2, 0, 0)` - Sideways force (wind)
- `(0, 0, 0)` - Zero gravity (space, magic)

**Tip:** Gravity is cumulative! Particles accelerate continuously

---

## Angular Velocity

Controls particle **spinning**

**Angular Velocity Min/Max** - Rotation speed (degrees/second)
- Positive = clockwise
- Negative = counter-clockwise
- Random value between min/max

**Angular Velocity Curve** - Change spin over lifetime

**What axis?** Rotates around **Z-axis** (facing camera when billboarded)
- Like spinning a coin facing you
- NOT tumbling through 3D space

---

## Angle Section Explained

**Initial rotation** around particle's Z-axis

**Angle Min/Max** - Starting rotation (degrees)
- Random angle chosen for each particle
- Example: Min 0, Max 360 = random orientation

**Angle Curve** - Rotation over lifetime

**Use cases:**
- Random snowflake orientations
- Spinning energy orbs
- Varied debris directions
- Making sprites face different ways

**Key point:** This is "2D rotation" like a steering wheel, not 3D tumbling!

---

## Advanced Forces

### Linear Accel
Accelerate along movement path
- Positive = speed up
- Negative = slow down

### Radial Accel  
Push away/pull toward center
- Positive = Explosion outward
- Negative = Vortex inward

### Tangential Accel
Perpendicular to radial (creates spirals!)

### Damping
Friction that slows particles over time

---

## Scale Properties

**Scale Min/Max** - Size range
- 1.0 = original mesh size
- 0.5 = half size, 2.0 = double size

**Scale Curve** - Size over lifetime
- Very powerful for effects!
- Common: Start small → grow → shrink

**Scale Over Velocity**
- Change size based on speed
- Fast particles = different size

---

## Color Properties

**Color** - Base tint (RGBA)

**Color Ramp** - Gradient over lifetime
- Left = birth, Right = death
- Perfect for fade effects
- Example: White → Transparent (fade out)
- Example: Yellow → Red → Black (fire)

**Color Initial Ramp** - Random starting colors
- Adds variety to particles

**Hue Variation** - Random color shifts

---

## Turbulence

Noise-based chaos and randomness

**Turbulence Enabled** - Turn on chaotic motion

**Noise Strength** - How much chaos (higher = more wild)

**Noise Scale** - Pattern size
- Small = rapid jittering
- Large = slow waves

**Noise Speed** - How fast patterns move

**Great for:** Wind, magical chaos, underwater effects

---

## Collision

Make particles interact with the world!

**Collision Mode:**
- **Disabled** - No collision
- **Rigid** - Bounce off surfaces  
- **Hide on Contact** - Disappear on hit

**Collision Friction** - Energy lost on contact (0-1)
- 0.0 = Slides freely
- 1.0 = Stops immediately

**Collision Bounce** - Bounciness (0-1)
- 0.0 = No bounce (sticks)
- 1.0 = Perfect elastic bounce

---

## Trail Settings

Create motion trails behind particles

**Trail Enabled** - Turn trails on

**Trail Lifetime** - How long trail lasts (seconds)
- Short = tight trails
- Long = visible streaks

**Trail Sections** - Smoothness (4-8 typical)
- More = smoother but more GPU cost

**Perfect for:** Comets, magic projectiles, speed lines

---

## Draw Pass - Visual Appearance

Defines what each particle **looks like**

### Common Mesh Types:
- **QuadMesh** - Flat square (most common for sprites)
- **SphereMesh** - 3D sphere (bubbles, orbs)
- **BoxMesh** - Cube (debris, blocks)
- **CylinderMesh** - Pillars, beams
- **Custom Mesh** - Import your own!

---

## Material Properties

Applied to the Draw Pass mesh

**Albedo → Texture** - The sprite/image
- Use textures with alpha channel

**Transparency** - Alpha blending
- Alpha = Smooth transparency (most common)

**Blend Mode:**
- **Mix** - Normal
- **Add** - Glowing effect (particles brighten)
- **Sub** - Darkening
- **Mul** - Multiplicative

---

## Material Properties (continued)

**Shading → Unshaded**
- Disable lighting for consistent brightness
- Most particles use this!

**Billboard → Enabled**
- Particle always faces camera
- Essential for flat sprites (QuadMesh)

**Vertex Color → Use as Albedo**
- Allows particle color to tint texture
- Usually enabled

---

## Example 1: Simple Fire

```
GPUParticles3D:
- Amount: 50
- Lifetime: 1.5
- Explosiveness: 0.0

Process Material:
Emission:
  - Shape: Sphere (Radius 0.2)
  - Direction: (0, 1, 0) - Upward
  - Spread: 15°
  - Velocity: 2-3

Gravity: (0, 0.5, 0) - Rises
Scale Curve: Shrink over time
Color Ramp: Orange → Red → Black
```

---

## Example 2: Rain

```
GPUParticles3D:
- Amount: 500
- Lifetime: 3.0

Process Material:
Emission:
  - Shape: Box (10, 0.1, 10)
  - Direction: (0, -1, 0)
  - Spread: 0°
  - Velocity: 15

Gravity: (0, -20, 0) - Falls fast
Particle Flags:
  - Align Y to Velocity: ON
Scale: 0.05 - 0.1

Draw Pass: Stretched QuadMesh
```

---

## Example 3: Explosion

```
GPUParticles3D:
- Amount: 200
- Lifetime: 1.0
- One Shot: true
- Explosiveness: 1.0 - All at once!

Process Material:
Emission:
  - Shape: Sphere (0.1)
  - Spread: 180°
  - Velocity: 5-10

Gravity: (0, -5, 0)
Damping: 2.0 - Slows quickly
Scale Curve: Peak then fade
Color Ramp: Yellow → Orange → Black
```

---

## Adding Textures

1. Create **StandardMaterial3D** on QuadMesh
2. Set **Albedo → Texture** to your sprite
3. Enable **Transparency → Alpha**
4. Set **Blend Mode:**
   - Mix for solid particles
   - Add for glowing effects
5. Enable **Billboard**
6. Enable **Vertex Color → Use as Albedo**

**Tip:** Use PNG with transparent background!

---

## Color Ramp Tutorial

For fade-out effect:

1. Enable **Color → Color Ramp**
2. Create **New GradientTexture1D**
3. Click gradient to edit
4. Add points:
   - Left: White, Alpha 1.0 (birth)
   - Right: White, Alpha 0.0 (death)

Result: Particles fade to transparent over lifetime!

---

## Scale Curve Tutorial

For grow-and-shrink effect:

1. Enable **Scale → Scale Curve**
2. Create **New CurveTexture**
3. Click curve to edit
4. Shape curve:
   - Start low (small at birth)
   - Peak in middle (grow)
   - End low (shrink before death)

Result: Dynamic size changes!

---

## Performance Tips

1. **Use fewer particles** when possible
2. **Limit Lifetime** - shorter = fewer on screen
3. **Fixed FPS 30** - less frequent updates
4. **One Shot** for single events (don't keep emitting)
5. **LOD** - reduce particles at distance
6. **Visibility Range** in Process Material
7. **Avoid collision** when not needed (expensive)

**Target:** Keep under 1000 active particles for good performance

---

## Common Issues & Solutions

### Particles not visible?
- ✅ Check Draw Pass is set
- ✅ Check Process Material is set  
- ✅ Check Emitting = true
- ✅ Move camera to see particles

### Particles too fast/slow?
- Adjust Initial Velocity
- Adjust Gravity
- Add Damping

### Particles look flat/wrong?
- Enable Billboard in material
- Check lighting settings
- Add color/scale curves for depth

---

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
    
func change_amount(count: int):
    amount = count
    restart()  # Apply changes
```

---

## Best Practices

**Do:**
- ✅ Experiment with settings
- ✅ Use curves for dynamic effects
- ✅ Combine multiple emitters for complex effects
- ✅ Start simple, add complexity gradually
- ✅ Study real-world references

**Don't:**
- ❌ Use too many particles unnecessarily
- ❌ Forget to enable Billboard on flat sprites
- ❌ Ignore performance considerations
- ❌ Skip the Process Material setup

---

## Advanced Techniques

### Multiple Emitters
Layer different particle systems:
- Large slow particles (base effect)
- Small fast particles (detail)
- Glow particles with additive blending

### Sub-Emitters
Particles that spawn other particles:
- Firework explodes → spawns sparks
- Bullet impact → spawns debris

### Attractors
Use GPUParticlesAttractor3D nodes:
- Pull particles toward points
- Create vortex effects

---

## Quick Reference: Common Effects

**Fire:** Sphere emission, upward gravity, shrinking scale, orange→red→black

**Smoke:** Similar to fire, slower, larger scale, gray colors

**Rain:** Box emission, downward gravity, Align Y to Velocity

**Snow:** Box emission, slight gravity, turbulence, slow falling

**Sparks:** Point emission, high spread, Align Y to Velocity, trails

**Explosion:** Sphere, One Shot, Explosiveness 1.0, radial velocity

**Magic:** Low gravity, turbulence, additive blending, color shifts

---

## Resources & Documentation

**Official Docs:**
- docs.godot.com - GPUParticles3D
- docs.godot.com - ParticleProcessMaterial

**Learning Tips:**
- Start with simple effects
- Modify one property at a time
- Save presets for reuse
- Study games you admire
- Practice, practice, practice!

**Community:**
- Godot Forums
- Reddit r/godot
- Discord servers

---

## Key Takeaways

1. **GPUParticles3D** = Fast, GPU-accelerated effects
2. **Process Material** = Behavior & physics
3. **Draw Pass** = Visual appearance
4. **Particle Flags** = Critical orientation controls
5. **Curves & Ramps** = Dynamic changes over time
6. **Experimentation** = The best way to learn!

**Remember:** Particles are visual, so hands-on practice is essential!

---

## Practice Assignment Ideas

**Beginner:**
- Create campfire effect
- Rain storm
- Falling leaves

**Intermediate:**  
- Explosion with debris
- Magic spell with trails
- Smoke grenade

**Advanced:**
- Waterfall with mist
- Fireworks display
- Weather system (rain + lightning sparks)

---

# Questions?

## Thank you!

*Now go create amazing particle effects!*

**Next steps:**
1. Open Godot
2. Create GPUParticles3D node
3. Experiment with properties
4. Build something awesome!

---