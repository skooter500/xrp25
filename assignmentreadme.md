# Below the surface

Name: Emmanuel Adeogun

Student Number: C22395882

Class Group:

Video:

https://youtu.be/9cDhJ2gNJBo

# Description of the project

<img width="1145" height="738" alt="image" src="https://github.com/user-attachments/assets/eb4fcbc5-c19a-4f20-969d-6810ec77ecf6" />
Below the Surface is an immersive virtual reality experience designed to raise awareness of UN Sustainable Development Goal 14: Life Below Water. The project places the user in a marine environment where they can explore and interact with an underwater scene affected by human pollution. Through exploration and simple interactions, the experience aims to highlight the impact of waste on marine ecosystems and the importance of conservation.

# Instructions for use
Run project in VR or pc mode and enjoy the scenery! Aim of the game is to fish out as much pollution while also learning about sustainable development goal 14 and the importance of keeping life preserved below water
<img width="1155" height="726" alt="image" src="https://github.com/user-attachments/assets/a8d4b74a-60b4-4a19-b8d2-982b2e3c8c14" />

<img width="1157" height="727" alt="image" src="https://github.com/user-attachments/assets/5b490c8f-b5d6-4500-b9dc-4c9be6ff686b" />

Water shader
<img width="1143" height="535" alt="image" src="https://github.com/user-attachments/assets/7ae531e9-5b92-4767-bc75-d936479bfcc3" />


# How it works

The player character is implemented using a CharacterBody3D, allowing for physics-based movement. Two movement modes are supported:

Grounded movement, where gravity is applied and the player can walk and jump on land.

Underwater movement, where gravity is disabled and buoyancy is applied, enabling free swimming in three dimensions.

An invisible Area3D water volume detects when the player enters or exits the water. When underwater, buoyancy and swimming controls are enabled, and environmental effects such as fog are applied. When the player exits the water, normal gravity-based movement resumes.

<img width="291" height="100" alt="image" src="https://github.com/user-attachments/assets/d6370962-1c06-4861-a10b-9ddd73124807" />
Underwater detection and trash spawner


# List of classes/assets in the project

| Class/asset | Source |
|-----------|-----------|
| Player.gd | Self written |
|Reef_cleanup_main.gd| Self written |
| Trash_item.gd | Self written |
| Trash_spawner.gd| Self written |
| Water_shader| Yt Vid|
| Terrain_scene| Modified from godot |
| Trash_models | Online|



# References
*[ Item 1](https://youtu.be/7L6ZUYj1hs8?si=yKhJKMnH4J_idrZE)
* [<img width="320" height="180" alt="image" src="https://github.com/user-attachments/assets/2cd86e65-6f3f-4c65-9bc6-fd50be4205af" />](https://youtu.be/oV8c9alXVwU?si=Fium_cKR4L_E7ghp)
* https://docs.godotengine.org/en/stable/tutorials/xr/openxr_body_tracking.html#htc-tracker-support


# What I am most proud of in the assignment
From a technical perspective, I am particularly proud of implementing the underwater
movement system, which required managing different physics states for walking and
swimming. Debugging issues related to buoyancy, gravity, and player state transitions
significantly improved my understanding of Godot’s physics system and CharacterBody3D
movement logic.
I am also proud of the project’s structure and organisation. The use of multiple scenes, scripts,
and systems—such as the HUD, trash collection mechanics, environmental effects, and
version control through Git—demonstrates a considered and professional approach to
development. Overcoming challenges related to input handling, collision detection, and UI
interaction strengthened my problem-solving skills and confidence when working with complex
systems.
# What I learned
I also learned how to design and implement interactive systems that respond meaningfully to
player input. Creating the trash collection mechanic using raycasting and collision layers
improved my understanding of how Godot handles physics interactions, signals, and node
hierarchies. Additionally, implementing a persistent HUD using CanvasLayer taught me how to
separate gameplay logic from user interface logic in a clean and maintainable way



