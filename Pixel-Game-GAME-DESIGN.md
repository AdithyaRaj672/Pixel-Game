# Pixel-Game — Full Product & Development Specification

## 1. Project Overview

**Project name:** Pixel-Game

**Goal:** Build a PC-first 2D pixel-art drag racing game inspired by the overall gameplay loop of mobile games such as Pixel Car Racer, while creating an original game, original branding, original UI, original cars/assets, and original code.

The game should eventually feel like a complete PC racing game rather than a small prototype.

### Core pillars

1. Drag racing
2. Garage and car ownership
3. Deep car customization
4. Performance upgrades
5. Tuning
6. Career/progression
7. Events/tournaments
8. Economy
9. Save/load
10. PC-quality menus and controls
11. Original pixel-art presentation
12. Extensible architecture for future features

---

# 2. Important Development Rule

Do NOT attempt to build the entire finished game in one implementation step.

The project must be developed incrementally in phases.

Every phase should leave the repository in a working state.

Claude Code should:

- inspect the existing project before changing it
- preserve working systems
- avoid unnecessary rewrites
- use reusable systems rather than hardcoding individual cars/races
- test changes after implementation
- fix errors it introduces
- document important architectural decisions
- avoid adding placeholder systems that are immediately thrown away
- keep the game playable whenever practical

---

# 3. Technology

## Primary engine

Use **Godot 4.x**.

Use GDScript unless there is a strong technical reason to use another language.

The game is intended primarily for Windows PC.

Target:

- 16:9 displays
- keyboard
- mouse
- controller support where practical
- windowed mode
- fullscreen mode
- configurable resolution
- scalable UI

The architecture should make future Linux builds possible without redesigning the game.

---

# 4. High-Level Game Loop

The intended player loop is:

```text
Main Menu
   ↓
Career / Free Race / Garage
   ↓
Choose Event
   ↓
Choose Car
   ↓
Tune / Upgrade / Customize
   ↓
Start Race
   ↓
Launch
   ↓
Shift Gears
   ↓
Use Boost / Nitrous where applicable
   ↓
Finish Race
   ↓
Win / Lose
   ↓
Rewards
   ↓
Upgrade / Buy / Tune
   ↓
Progression
```

The game should encourage repeated racing and gradual improvement.

---

# 5. Game Modes

## 5.1 Career Mode

The main progression mode.

The player starts with limited money and an entry-level car.

Career should contain:

- events
- race classes
- opponents
- increasing difficulty
- rewards
- unlock requirements
- progression gates
- tournaments
- boss/high-level events eventually

Do not make the career system dependent on hardcoded individual screens.

Events should be data-driven.

---

## 5.2 Quick Race

Allow the player to race without affecting or minimally affecting career progression.

Useful for:

- testing cars
- testing upgrades
- practicing gear shifts
- experimenting with tuning

---

## 5.3 Tournament

A tournament consists of multiple races.

Example:

```text
Tournament
 ├── Race 1
 ├── Race 2
 ├── Race 3
 └── Final
```

The player receives tournament rewards based on overall performance.

---

## 5.4 Practice / Test Run

A testing mode where the player can experiment with:

- launch
- gear ratios
- shift timing
- acceleration
- nitrous
- tuning

Eventually this can become a dyno/test facility.

---

# 6. Drag Racing System

This is the most important gameplay system.

The game should be a side-view drag racing game.

The player controls:

- launch timing
- throttle
- gear shifting
- nitrous/boost where equipped

The race should not simply be a pre-recorded animation.

Vehicle performance should be calculated from the car's actual configuration.

---

# 7. Race Start

Possible sequence:

```text
READY
3
2
1
GO
```

The exact presentation can evolve.

Launch performance should depend on:

- throttle
- RPM
- traction
- tires
- launch tuning
- drivetrain
- engine characteristics

A perfect launch should reward skill.

---

# 8. Engine Simulation

The game does not need to simulate a real-world engine perfectly.

It needs a believable and fun simplified simulation.

Important values:

- RPM
- torque
- horsepower
- redline
- idle RPM
- gear ratios
- final drive
- vehicle mass
- tire grip
- drivetrain loss
- acceleration
- top speed

A car should feel meaningfully different after upgrades.

---

# 9. Transmission

Support manual gear shifting.

Each car should have:

- number of gears
- gear ratios
- final drive
- shift RPM range
- optimal shift point

Later support:

- automatic transmission
- transmission upgrades
- tuning

Poor shifts should reduce acceleration.

Perfect shifts should reward the player.

---

# 10. Nitrous / Boost

Some cars/builds can use nitrous.

Nitrous should:

- temporarily increase power
- consume a limited amount
- have a visual/audio effect
- be upgradeable
- be configurable where appropriate

Do not make nitrous mandatory for every race.

---

# 11. Vehicle System

Cars must be data-driven.

Do NOT create every car by writing unique racing code.

A vehicle should be represented by data such as:

```text
CarDefinition
 ├── name
 ├── manufacturer/display brand
 ├── class
 ├── mass
 ├── engine
 ├── horsepower
 ├── torque
 ├── redline
 ├── drivetrain
 ├── transmission
 ├── gear_ratios
 ├── final_drive
 ├── tire_grip
 ├── nitrous_capacity
 ├── price
 ├── unlock_requirement
 ├── sprite/assets
 └── upgrade_slots
```

Use Resources or another Godot-native data-driven approach where appropriate.

---

# 12. Original Content Requirement

The project is inspired by the genre and gameplay structure of Pixel Car Racer.

Do NOT copy:

- Pixel Car Racer source code
- proprietary assets
- exact UI
- logos
- copyrighted sprites
- copyrighted car artwork
- proprietary audio
- exact branding
- extracted game data

Create an original identity for Pixel-Game.

Real-world vehicle manufacturers and models should only be included if their licensing situation is properly considered.

For early development, use fictional vehicle manufacturers and fictional car models.

---

# 13. Car Classes

Start with a manageable class system.

Example:

```text
Class D
Class C
Class B
Class A
Class S
```

The exact naming can change.

Classes should be based on performance/rules rather than simply being arbitrary labels.

---

# 14. Garage

The garage is one of the game's major screens.

It should show:

- current car
- car name
- performance statistics
- installed upgrades
- visual appearance
- current value
- available actions

Actions:

- Start race
- Upgrade
- Tune
- Customize
- Change car
- Sell
- Inspect

---

# 15. Performance Statistics

Display understandable statistics.

Examples:

- Power
- Torque
- Weight
- Grip
- 0–60
- 1/4 mile estimate
- top speed
- class
- rating

Stats should update when the player changes upgrades.

---

# 16. Upgrade System

Performance upgrades should be modular.

Potential categories:

### Engine

- intake
- exhaust
- headers
- turbo
- supercharger
- ECU
- fuel system
- intercooler
- internal engine components

### Transmission

- gearbox
- clutch
- gear ratios
- final drive

### Tires

- street
- sport
- racing
- drag

### Weight

- weight reduction
- lightweight components

### Nitrous

- capacity
- power
- duration

The first implementation should use a smaller set and expand later.

---

# 17. Upgrade Architecture

Each upgrade should modify vehicle stats through a reusable system.

Avoid:

```text
if car == "CarA":
    horsepower += 20
```

Prefer:

```text
Upgrade
 ├── category
 ├── level
 ├── price
 ├── stat_modifiers
 └── requirements
```

This allows hundreds of combinations without rewriting the vehicle code.

---

# 18. Upgrade Levels

Example:

```text
Stock
Stage 1
Stage 2
Stage 3
Stage 4
Stage 5
```

The exact number can be adjusted.

Each stage should have:

- price
- performance effect
- visual indication
- unlock requirements

---

# 19. Tuning

Tuning should eventually become a major system.

Potential tuning parameters:

- gear ratios
- final drive
- tire pressure
- launch RPM
- shift point
- nitrous timing
- boost pressure
- ECU settings

Do not implement every tuning feature immediately.

First create the tuning architecture, then add individual tunable parameters.

---

# 20. Dyno / Testing

Eventually provide a dyno/test screen.

It can show:

- horsepower curve
- torque curve
- RPM
- speed
- acceleration
- estimated quarter-mile time

The player should be able to test modifications before racing.

---

# 21. Customization

The player should be able to modify the appearance of cars.

Potential features:

- paint
- wheels
- spoilers
- bumpers
- hoods
- exhaust
- decals
- window tint
- stance
- body kits
- lighting

Build this using modular visual parts rather than baking every combination into a separate sprite.

---

# 22. Pixel-Art Style

The game should use a cohesive pixel-art style.

Target qualities:

- crisp pixels
- no blurry scaling
- consistent pixel density
- limited but attractive palettes
- readable silhouettes
- clear UI

Do not randomly mix assets from unrelated visual styles.

Use placeholders during engineering if final art is unavailable.

Placeholder assets must be easy to replace later.

---

# 23. UI

Main screens:

```text
Main Menu
Garage
Car Selection
Career
Race Selection
Race
Results
Upgrade Shop
Tuning
Customization
Tournament
Settings
Save/Profile
```

UI should be designed for PC.

Support:

- mouse
- keyboard navigation
- controller navigation later

---

# 24. Economy

The game should have an in-game currency.

Players earn money through:

- race wins
- race participation
- tournament rewards
- special events

Players spend money on:

- cars
- upgrades
- customization
- repairs if the system eventually requires them

Avoid making the economy frustrating.

The game is not required to use real-money purchases.

---

# 25. Progression

Progression should unlock:

- new cars
- new classes
- new events
- new upgrades
- tournaments
- tuning features

Potential progression variables:

```text
player_level
career_progress
money
owned_cars
completed_events
unlocked_events
reputation
```

---

# 26. Save System

The player must be able to close the game and retain progress.

Save:

- money
- owned cars
- current car
- upgrades
- tuning
- customization
- progression
- completed events
- settings

Use a versioned save format so the save system can evolve.

Example concept:

```json
{
  "save_version": 1,
  "money": 10000,
  "current_car": "starter_01"
}
```

Do not hardcode assumptions that make future save migrations impossible.

---

# 27. Audio

Eventually include:

- engine sounds
- gear shift sounds
- tire sounds
- nitrous
- UI sounds
- countdown
- race finish
- menu music
- garage ambience

Audio architecture should use reusable sound resources.

Use placeholder sounds during early development if necessary.

---

# 28. Input

Create an input abstraction instead of hardcoding keys throughout the code.

Example actions:

```text
accelerate
brake
shift_up
shift_down
nitrous
pause
menu_confirm
menu_back
```

Default keyboard controls can be assigned later.

Allow rebinding eventually.

---

# 29. Project Architecture

A possible architecture:

```text
Pixel-Game/
│
├── project.godot
├── README.md
├── GAME_DESIGN.md
├── DEVELOPMENT.md
├── CHANGELOG.md
│
├── assets/
│   ├── cars/
│   ├── environments/
│   ├── ui/
│   ├── audio/
│   └── fonts/
│
├── data/
│   ├── cars/
│   ├── upgrades/
│   ├── events/
│   └── tuning/
│
├── scenes/
│   ├── main/
│   ├── menus/
│   ├── garage/
│   ├── racing/
│   ├── upgrades/
│   ├── tuning/
│   └── results/
│
├── scripts/
│   ├── core/
│   ├── cars/
│   ├── racing/
│   ├── progression/
│   ├── economy/
│   ├── save/
│   ├── ui/
│   └── audio/
│
└── tests/
```

Claude may improve this structure if it has a strong reason.

Do not blindly follow the structure if Godot conventions suggest a better organization.

---

# 30. Core Systems

The architecture should eventually contain separate systems for:

```text
GameManager
SaveManager
CarManager
RaceManager
EconomyManager
ProgressionManager
AudioManager
InputManager
SettingsManager
```

Avoid creating one giant script.

---

# 31. Data-Driven Events

Race events should be data-driven.

An event could contain:

```text
event_id
name
class
distance
opponents
difficulty
entry_requirement
reward
unlock_requirement
```

This allows new races to be added without rewriting gameplay code.

---

# 32. Opponent System

Opponents should eventually have:

- car definition
- performance configuration
- driver difficulty
- reaction time
- shifting behavior
- nitrous behavior
- tuning

The AI does not need to control a complex physics car initially.

For drag racing, an opponent performance model is sufficient.

---

# 33. Difficulty

Difficulty should be based on measurable performance.

Avoid simply multiplying opponent speed by an arbitrary value.

Possible factors:

- reaction time
- launch quality
- shift quality
- vehicle performance
- nitrous usage
- tuning

---

# 34. Race Results

After every race show:

- position
- opponent
- time
- distance
- reward
- performance summary

Then allow:

```text
Continue
Race Again
Garage
Career
```

---

# 35. Settings

Eventually include:

- resolution
- fullscreen
- volume
- music volume
- SFX volume
- control configuration
- pixel scaling options
- language support architecture

---

# 36. Development Phases

## Phase 0 — Project Foundation

Goal:

Create the Godot project and architecture.

Implement:

- project configuration
- folder structure
- main scene
- basic UI theme
- input actions
- game bootstrap
- placeholder assets
- documentation
- basic state management

Acceptance:

- game launches
- main menu appears
- no errors
- project structure is clean

---

## Phase 1 — First Playable Drag Race

Implement:

- player car
- opponent
- countdown
- acceleration
- RPM
- gears
- shifting
- finish line
- race result
- restart

Acceptance:

A player can launch the game, start a race, shift gears and win/lose.

---

## Phase 2 — Vehicle Data System

Implement:

- CarDefinition
- stats
- drivetrain
- engine parameters
- transmission
- reusable car loading

Acceptance:

At least 3 fictional cars can use the same racing system while feeling different.

---

## Phase 3 — Garage

Implement:

- garage scene
- car selection
- owned cars
- stats display
- switching current car

Acceptance:

Player can own multiple cars and select which one to race.

---

## Phase 4 — Economy

Implement:

- currency
- race rewards
- purchases
- spending
- basic shop

Acceptance:

Player can earn money and buy a car.

---

## Phase 5 — Upgrades

Implement:

- upgrade definitions
- upgrade shop
- engine upgrades
- transmission upgrades
- tire upgrades
- stat recalculation

Acceptance:

An upgrade visibly changes vehicle performance.

---

## Phase 6 — Career

Implement:

- events
- progression
- unlocks
- classes
- rewards
- event selection

Acceptance:

Player can progress through a career.

---

## Phase 7 — Customization

Implement:

- paint
- wheels
- modular cosmetic parts
- visual preview

---

## Phase 8 — Tuning

Implement:

- gear ratio tuning
- final drive
- launch RPM
- tuning persistence
- tuning impact on racing

---

## Phase 9 — Tournament

Implement:

- tournament structure
- multiple rounds
- scoring
- rewards
- progression

---

## Phase 10 — Dyno / Testing

Implement:

- dyno screen
- performance graphs
- test run
- tuning feedback

---

## Phase 11 — Audio & Polish

Implement:

- engine audio
- UI audio
- race sounds
- music
- visual effects
- screen transitions
- particles
- feedback

---

## Phase 12 — Save/Load Hardening

Implement:

- versioned saves
- validation
- corruption handling
- migration support
- backup saves

---

## Phase 13 — PC Release Preparation

Implement:

- Windows export
- fullscreen
- resolution handling
- controller support
- input rebinding
- performance optimization
- crash/error handling
- final settings

---

# 37. Claude Code Development Rules

Claude should behave as a senior game developer.

Before implementing a major feature:

1. Inspect the current repository.
2. Identify existing systems.
3. Explain the intended approach briefly.
4. Implement the smallest complete version.
5. Run/test the project.
6. Fix errors.
7. Check for regressions.
8. Update documentation where appropriate.

Do not ask unnecessary questions.

If a decision is not specified and a reasonable engineering choice exists, make the choice and document it.

If a decision could fundamentally change the product, stop and ask.

---

# 38. Request Efficiency

Because the available model has a daily request limit, prioritize complete tasks.

Do not spend requests on tiny cosmetic changes during early development.

Prefer tasks like:

```text
Build the complete vehicle data system.
```

over:

```text
Create CarDefinition.
```

Then:

```text
Add horsepower.
```

Then:

```text
Add weight.
```

Then:

```text
Add torque.
```

A single request should ideally produce a coherent feature.

---

# 39. Testing Rule

Every major implementation must be tested.

Claude should run appropriate Godot checks where available.

If the project can be launched from the command line, use that to detect errors.

Do not claim a feature works without testing it when testing is possible.

---

# 40. Git Workflow

The repository is:

`AdithyaRaj672/Pixel-Game`

The local project should remain connected to the GitHub remote.

Recommended workflow:

```text
GitHub
   ↓ clone
Local WSL repository
   ↓
Claude Code edits files
   ↓
Test
   ↓
git status
   ↓
git diff
   ↓
git add
   ↓
git commit
   ↓
git push
   ↓
GitHub
```

Do not let Claude blindly overwrite the repository history.

Review changes before committing when practical.

---

# 41. Commit Strategy

Use meaningful commits.

Examples:

```text
chore: initialize Godot project
feat: add drag race prototype
feat: add vehicle data system
feat: add garage
feat: add economy system
feat: add performance upgrades
feat: add career progression
feat: add car customization
feat: add tuning system
feat: add tournament mode
feat: add save system
polish: improve race presentation
```

Avoid commits such as:

```text
stuff
changes
update
test
fixed things
```

---

# 42. Git Safety

Before major changes:

```bash
git status
```

After Claude changes files:

```bash
git status
git diff
```

Only commit changes that are understood.

Before pushing:

```bash
git status
git log --oneline -5
```

If Claude creates unexpected files, inspect them before committing.

Never commit secrets, API keys, passwords, tokens, or private credentials.

---

# 43. First Milestone

The first milestone is NOT the full game.

The first milestone is:

> A clean Godot project that launches into an original garage/menu and can start a playable drag race with one player car and one opponent.

This becomes the foundation for everything else.

---

# 44. First Claude Code Task

When the repository is cloned locally and Claude Code is started from the repository root, give Claude this task:

```text
You are the lead developer for Pixel-Game.

Read GAME_DESIGN.md completely before making changes.

The repository is currently an empty GitHub repository and we are starting development from scratch.

For this first task, create the complete foundational Godot 4.x project for Pixel-Game.

Requirements:

1. Create a clean Godot project.
2. Establish a scalable folder architecture for scenes, scripts, assets, data, and tests.
3. Create a bootstrap/main scene.
4. Create an original placeholder main menu.
5. Create a basic game state/navigation architecture that can later support:
   - Main Menu
   - Garage
   - Career
   - Race
   - Results
   - Upgrades
   - Tuning
   - Customization
   - Settings
6. Create the initial input actions for:
   - accelerate
   - brake
   - shift_up
   - shift_down
   - nitrous
   - pause
   - menu_confirm
   - menu_back
7. Create reusable architecture rather than putting everything in one giant script.
8. Add sensible placeholder assets only where necessary.
9. Add a README.md explaining how to open and run the project.
10. Add or update DEVELOPMENT.md with the current architecture and development rules.
11. Add a basic .gitignore appropriate for Godot.
12. Do NOT implement the complete racing system yet.
13. Do NOT implement the garage's complete functionality yet.
14. Do NOT add unnecessary third-party dependencies.
15. Keep the project original and do not copy Pixel Car Racer assets, code, UI, branding, or proprietary data.

After implementation:

- inspect the final project structure
- run the project or an appropriate Godot validation/test command
- fix any errors you introduced
- verify that the main menu launches successfully
- summarize exactly what was created
- list any remaining issues

Do not modify Git history or push to GitHub unless explicitly asked.
```

---

# 45. Important Instruction for Future Claude Sessions

At the beginning of future sessions, Claude should first inspect:

```text
GAME_DESIGN.md
DEVELOPMENT.md
README.md
```

Then inspect the relevant implementation before making changes.

The design document is the product direction.

The code is the current implementation.

If they disagree:

1. Determine whether the code is intentionally ahead of the document.
2. Do not blindly rewrite working code.
3. Update the documentation if the implementation represents a deliberate improvement.

---

# 46. Definition of "Done"

A feature is not complete simply because files were created.

A feature is complete when:

- it is implemented
- it integrates with the existing architecture
- it can be used from the game
- it has been tested
- obvious errors are fixed
- data is saved when necessary
- documentation is updated when necessary
- it does not unnecessarily break existing features

---

# 47. Long-Term Vision

The final game should feel like a complete original PC drag racing game with:

- a strong pixel-art identity
- satisfying drag racing
- meaningful car differences
- deep upgrades
- tuning
- customization
- career progression
- tournaments
- economy
- garage management
- testing/dyno
- save/load
- polished PC controls
- scalable architecture

The architecture should also make it possible to add future systems such as:

- online leaderboards
- additional race types
- multiplayer
- more classes
- more cars
- weather
- special events
- achievements
- statistics
- replays
- mod support

These future features should NOT be implemented until the core single-player game is stable.

---

# 48. Final Principle

Build the game in layers.

Do not chase the final feature list immediately.

The order is:

```text
Foundation
    ↓
Playable Race
    ↓
Cars
    ↓
Garage
    ↓
Economy
    ↓
Upgrades
    ↓
Career
    ↓
Customization
    ↓
Tuning
    ↓
Tournaments
    ↓
Dyno
    ↓
Audio
    ↓
Polish
    ↓
Release
```

Every layer should be stable before the next major layer is added.
