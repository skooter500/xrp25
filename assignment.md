# eXtended Reality Prototyping Assignment 2024

"Quest:SDG - Extended Reality for Sustainable Development"

![](images/questsdg.png)

For this assignment, you will demonstrate your creativity and technical competency with Godot and XR development by creating an interactive experience inspired by the UN Sustainable Development Goals (SDGs). Your project must be deployed to an XR headset, or mobile device and should educate, engage, or inspire action around one or more of the 17 SDGs.

This assignment builds on the Quest:SDG project developed over summer. You may choose to:

- **Extend Quest:SDG**: Add new features, goals, interactions, or systems to the existing project

- **Create a standalone experience**: Build your own SDG-focused XR application from scratch

Projects can be completed **individually or in teams of up to 3 students**.

## The 17 UN Sustainable Development Goals
1. No Poverty
2. Zero Hunger
3. Good Health and Well-being
4. Quality Education
5. Gender Equality
6. Clean Water and Sanitation
7. Affordable and Clean Energy
8. Decent Work and Economic Growth
9. Industry, Innovation and Infrastructure
10. Reduced Inequalities
11. Sustainable Cities and Communities
12. Responsible Consumption and Production
13. Climate Action
14. Life Below Water
15. Life on Land
16. Peace, Justice and Strong Institutions
17. Partnerships for the Goals

## Project Ideas

Of course! Here is a revised "Project Ideas" section focused on smaller, more achievable scopes for a single semester.

---

## Project Ideas

Here are some focused, achievable project ideas designed to be completed within a single semester. Remember, a **simple, polished experience is better than a complex, unfinished one.**

### Simple & Focused Experiences (Ideal for Individuals or Small Teams)

**1. SDG 13: Climate Action - "The Melting Glacier"**
*   **Concept:** A single, powerful scene. The user stands on a virtual glacier. Over 60 seconds, they watch it rapidly melt due to rising temperatures, revealing barren rock beneath. A simple UI shows the tons of ice lost and sea-level rise equivalent.
*   **XR Features:** A simple shader to "shrink" the glacier model, ambient sound of dripping water turning into silence, spatial UI for stats.
*   **Scope:** One environment, one core visual effect, minimal interaction.

**2. SDG 14: Life Below Water - "Ocean Plastics Cleanup"**
*   **Concept:** A stationary underwater experience. The user uses their hands to grab floating plastic bottles and bags and put them in a virtual recycling bin. A counter shows how many items they've collected.
*   **XR Features:** Hand tracking to grab objects, simple physics for floating debris, particle effects for bubbles.
*   **Scope:** One environment, one interaction (grab), a handful of 3D models.

**3. SDG 15: Life on Land - "Virtual Bee Pollinator"**
*   **Concept:** The user embodies a bee. They fly from one flower to another (using a simple point-and-teleport mechanic). As they touch each flower, it blooms and a "pollination counter" increases. The goal is to pollinate all flowers in a small garden.
*   **XR Features:** Teleportation locomotion, simple trigger-based interaction (touching the flower), particle effects for pollen.
*   **Scope:** A small garden scene, one core game loop, simple visual feedback.

**4. SDG 6: Clean Water & Sanitation - "Water Source Tracer"**
*   **Concept:** An educational diorama. The user looks at a cross-section of a landscape (a mountain, river, and town). They can press buttons to see how a pollutant (e.g., factory waste, farm runoff) travels from the source to contaminate the town's drinking water.
*   **XR Features:** 3D UI buttons, a simple particle system or line renderer to trace the pollution path, spatial audio for information narration.
*   **Scope:** One static scene, interactive buttons that trigger animations/effects.

**5. SDG 7: Affordable & Clean Energy - "Home Energy Inspector"**
*   **Concept:** A **Passthrough AR** experience. The user looks around their real room. Virtual icons appear over real-world objects (a light bulb, a laptop charger) showing their energy consumption. Tapping an icon reveals how much energy it uses and suggests a more efficient alternative (e.g., LED bulb).
*   **XR Features:** Passthrough AR, placing 3D UI elements in the user's real space, simple hand-tracking or controller-based selection.
*   **Scope:** Focuses on UI design and passthrough integration, not a complex 3D world.

**6. SDG 12: Responsible Consumption - "The Packaging Unwrapper"**
*   **Concept:** The user picks up a single, over-packaged product (e.g., a small electronic in a large plastic clamshell). As they virtually unwrap each layer, text appears showing the waste generated (e.g., "Layer 1: 15g of non-recyclable plastic").
*   **XR Features:** Hand tracking to peel away layers (using simple animation or object swapping), spatial text labels.
*   **Scope:** One core interaction, one product model, focused message.

**7. SDG 4: Quality Education - "Solar System Explorer"**
*   **Concept:** A scale model of the solar system floats in front of the user. They can grab planets to learn their names and a key fact. They can also trigger an animation to see the orbits.
*   **XR Features:** Grabbing and rotating 3D models, 3D UI for facts, simple timeline animation for orbits.
*   **Scope:** A handful of 3D models (planets), one interaction type (grab/rotate), simple animations.

### Key to a Successful Project

*   **One Core Interaction:** Master one interaction (e.g., grabbing, pointing, pressing a button) and make it feel polished.
*   **One Main Scene:** Avoid complex scene transitions. Build one well-designed environment.
*   **Clear, Singular Message:** Pick one specific aspect of one SDG. Don't try to explain the entire goal.
*   **Polish over Features:** A project with beautiful lighting, smooth interactions, and good sound for one idea will score higher than a project with five half-finished ideas.

## Technical Requirements
- Must be deployed and fully functional on Quest 3 (or mobile device)
- Must use version control (git) throughout development with regular commits
- Must meaningfully address at least one UN SDG (educational, awareness-raising, or action-oriented)
- Must utilize XR-specific features (hand tracking, spatial audio, 3D UI, passthrough, etc.)
- Should demonstrate understanding of Godot's XR systems and SDG concepts
- Must include proper attribution for any assets used (textures, 3D models, data sources)

## Deliverables

### Proposal (10% - Due 24th October)

Your proposal should include:

1. **Project Overview** (200-300 words)
   - Project title and concept
   - Which SDG(s) your project addresses and why
   - Whether extending Quest:SDG or creating standalone
   - Team members (if applicable) and role distribution#
   - Key features and interactions
   - XR technologies you'll use (hand tracking, passthrough, spatial audio, etc.)
   - At least 3 sketches or diagrams showing:
     - Main user interface
     - Key interactions
     - Spatial layout/environment
   - Can be hand-drawn, digital, or simple 3D blockouts

**Submission Format**: initial git repository link + readme.md file containing the above information

### Final Deliverable (40% - End of Semester)

1. **Working XR or Mobile Application** demonstrated in class
   
2. **Git Repository**
   - Regular commits throughout development (minimum 20 meaningful commits)
   - Clear commit messages
   - README with setup instructions
   - .gitignore properly configured
   - Include all the sections in this [readme.md]()() file

**References**: All sources, assets, and research materials cited properly

3. **Video Demonstration**
   - Live demonstration of all features in XR
   - Upload to YouTube and embed in your readme.md

**Submission Format**: 
- In class demo
- Documentation in the readme.md
- Video uploaded to YouTube/Vimeo
- Git repository link

## Rubric
| Category | Weighting | 1 | 2.1 | 2.2 | Pass | Fail |
|----------|-----------|--------|----|----|----|----|
| **Technical Implementation** | 40% | Advanced algorithm design (e.g., procedural environment generation, complex gesture recognition, spatial audio systems, custom hand-tracking interactions). Sophisticated use of Godot's XR toolkit or other asset. Multiple custom nodes/systems showing SOLID principles. Complex state management and scene architecture. Effective performance optimization for mobile XR. Demonstrates significant self-directed learning of XR topics beyond course material. Clean, well-structured code. Excellent git workflow with meaningful, regular commits throughout development. Strong integration of SDG content with technical systems. | Implementation of moderately complex XR features (e.g., hand tracking, spatial UI design, basic gesture detection, spatial audio). Good use of Godot's built-in XR systems and nodes. Custom scripts showing good OOP practices. Basic visual effects. Evidence of self-directed learning. Regular, well-documented git commits. Good SDG content integration. Functional XR deployment to headset. | Basic XR feature implementation using primarily built-in Godot XR functionality. Some custom nodes. Simple hand tracking or controller input. Basic spatial interactions and UI. Adequate SDG representation. Basic version control usage. Functional deployment with acceptable performance. | Minimal working XR implementation. Limited interactions beyond basic controller input. Poor code structure. Sparse git usage. Weak SDG integration. Deployment works but with performance issues. | Non-functional XR implementation. Doesn't deploy to headset or crashes frequently. No version control. Code doesn't compile or run. No meaningful SDG content. |
| **User Experience & Creativity** | 30% | Highly innovative XR concept with strong SDG alignment. Exceptional attention to XR user interaction design (comfort, intuitive spatial UI, natural gestures). Professional-quality visual feedback and environmental design. Novel approach to communicating SDG concepts in XR. Outstanding comfort considerations (locomotion, UI placement, interaction ergonomics). Demonstrates deep understanding of XR platform capabilities and limitations. High degree of polish and refinement. Clear educational impact or awareness-raising value. | Good original concept with clear SDG purpose. Intuitive and comfortable XR interface. Meaningful visual/audio feedback. Good spatial UI design. Effective SDG communication. Shows creativity in XR implementation. Good platform integration and performance. Evidence of user testing and iteration. | Basic but complete XR concept. Functional interface and interactions. Simple feedback systems. Adequate SDG representation. Standard XR interaction patterns. Limited but acceptable comfort design. Some consideration of user experience. Meets basic requirements. | Minimal XR interaction design. Basic feedback. Poor comfort considerations. Weak SDG connection or unclear messaging. Poor platform integration. Limited user testing evident. | Incomplete or non-functional experience. Causes discomfort or disorientation. No meaningful SDG content. Unusable interface. |
| **Technical Documentation** | 30% | Comprehensive documentation, thorough feature documentation, clear setup and deployment instructions, known issues/limitations, performance analysis, XR-specific implementation details, SDG research and integration rationale. Professional video demonstration (5-10 minutes) showing all features, technical highlights, XR-specific functionality, and development process. Exemplary git history with regular, well-documented commits throughout development showing clear progression. All sources and assets properly cited. | Good documentation covering main systems and features. Solid setup guide and deployment instructions. Good quality video demo showing key features and code. Regular git commits with meaningful messages. XR implementation explained well. SDG integration documented. Proper citations. | Basic documentation of core features. Simple diagrams present. Video demonstration shows main functionality. Some git history with adequate commit messages. Basic explanation of XR systems and SDG connection. | Minimal documentation. Poor quality or very brief video. Few git commits or unclear commit messages. Limited explanation of technical implementation. Weak or missing SDG rationale. | No documentation or completely inadequate. Missing video or non-functional recording. No meaningful version control history. No citations or attribution. |

**Note on Team Projects**: 
- All team members must contribute equally and will be individually assessed
- Unequal contribution may result in different grades for team members
- Git commits will be used to verify contribution


## Resources
- Quest:SDG base project (available in course repository)
- Godot XR documentation: https://docs.godotengine.org/en/stable/tutorials/xr/
- UN SDG resources: https://sdgs.un.org/
- Meta Quest development guides
- Previous student projects showcase (will be shared in class)

**The rubric features are indicative rather than exhaustive** - exceptional work may demonstrate excellence in ways not explicitly listed. Focus on showing mastery of XR development and Godot while meaningfully engaging with the UN Sustainable Development Goals.

---