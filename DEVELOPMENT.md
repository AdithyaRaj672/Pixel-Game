# Pixel-Game - Development Documentation

## Project Architecture

### Overview

Pixel-Game is a PC-first 2D pixel-art drag racing game built with Godot 4.x. The project follows a modular, scalable architecture designed to support incremental development across multiple phases.

### Core Systems

The architecture is organized into several key systems:

#### 1. Input Management
- Centralized input handling for racing and menu controls
- Actions: accelerate, brake, shift_up, shift_down, nitrous, pause, menu_confirm, menu_back
- Configurable keyboard and controller support

#### 2. Game State Manager
- Scene navigation and state management
- State transitions between game screens
- Persistent game data handling

#### 3. Resource Management
- Data-driven car and upgrade definitions
- Resource loading and caching
- Placeholder asset system

#### 4. Audio Management
- Sound effects and music management
- Volume control and audio settings

#### 5. Save System
- Basic save/load functionality for progress
- Versioned save format for future compatibility

### Folder Structure

```
Pixel-Game/
├── scenes/                    # Game scenes
│   ├── main/                 # Main game scenes
│   ├── menus/                # Menu scenes
│   ├── garage/               # Garage interface
│   ├── racing/               # Racing gameplay
│   ├── upgrades/             # Upgrade shop
│   ├── tuning/               # Tuning interface
│   └── results/              # Results screens
├── scripts/                   # Game logic
│   ├── core/                 # Core systems
│   ├── cars/                 # Car systems
│   ├── racing/               # Racing logic
│   ├── progression/          # Game progression
│   ├── economy/              # Economy systems
│   ├── save/                 # Save/load systems
│   ├── ui/                   # UI logic
│   └── audio/                # Audio systems
├── assets/                    # Game art and audio
│   ├── cars/                 # Car sprites and assets
│   ├── environments/         # Backgrounds and environments
│   ├── ui/                   # UI assets
│   ├── audio/                # Sound effects and music
│   └── fonts/                # Text fonts
├── data/                      # Game data
│   ├── cars/                 # Car definitions
│   ├── upgrades/             # Upgrade definitions
│   ├── events/               # Event definitions
│   └── tuning/               # Tuning parameters
└── tests/                     # Test implementations
```

## Development Workflow

### Phase-Based Development

The project is developed incrementally through phases:

- **Phase 0**: Project Foundation (Current)
  - Project structure and architecture
  - Basic input and state management
  - Main menu system
  - Placeholder assets

- **Phase 1**: First Playable Drag Race
  - Player car and opponent
  - Countdown and acceleration
  - Gear shifting and finish line
  - Race results

- **Phase 2**: Vehicle Data System
  - Car definitions and parameters
  - Engine and transmission systems
  - Data-driven vehicle loading

- **Phase 3**: Garage
  - Car selection and management
  - Upgrade and tuning interfaces

- **Phase 4**: Economy
  - Currency system
  - Race rewards and purchases
  - Basic shop functionality

- **Phase 5**: Upgrades
  - Upgrade definitions
  - Engine, transmission, and tire upgrades
  - Stat recalculation system

- **Phase 6**: Career
  - Event system
  - Progression and unlocks
  - Class-based difficulty

- **Phase 7**: Customization
  - Paint and cosmetic options
  - Modular visual parts
  - Visual preview system

- **Phase 8**: Tuning
  - Gear ratio and final drive tuning
  - Launch RPM and shift point tuning
  - Tuning persistence

- **Phase 9**: Tournament
  - Tournament structure
  - Multiple rounds and scoring
  - Tournament rewards

- **Phase 10**: Dyno/Testing
  - Performance graphs
  - Test run facility
  - Tuning feedback

- **Phase 11**: Audio & Polish
  - Engine and UI audio
  - Music and sound effects
  - Visual effects and feedback

- **Phase 12**: Save/Load Hardening
  - Versioned saves
  - Validation and corruption handling
  - Migration support

- **Phase 13**: PC Release Preparation
  - Windows export
  - Controller support
  - Performance optimization

### Development Rules

1. **Incremental Development**: Each phase must be completed before moving to the next
2. **Modular Architecture**: Avoid monolithic scripts; keep systems focused and reusable
3. **Data-Driven**: Use data definitions instead of hardcoded values where possible
4. **Testing**: Every major implementation must be tested
5. **Documentation**: Update documentation for all changes
6. **Original Content**: Create original assets and code; don't copy existing solutions

### Code Review Process

Before implementing major features:

1. Inspect the current repository
2. Identify existing systems
3. Explain the intended approach
4. Implement the smallest complete version
5. Run and test the project
6. Fix errors
7. Check for regressions
8. Update documentation

## Current Phase

**Phase 0 - Project Foundation** (IN PROGRESS)

### Goals

- Create clean Godot 4.x project
- Establish scalable project structure
- Implement basic input actions
- Create navigation/state architecture
- Build placeholder main menu
- Set up core game systems

### Acceptance Criteria

- Game launches successfully
- Main menu appears and is functional
- No errors or warnings in Godot
- Project structure is clean and maintainable
- Input actions are properly configured
- Scene navigation works between basic states

## Architectural Decisions

### 1. Godot 4.x Engine

**Why**: Godot provides excellent 2D support, GDScript for rapid development, and cross-platform capabilities.

**Considerations**: The project is PC-first but designed to support future Linux builds.

### 2. Modular Script Architecture

**Why**: Keeps code maintainable, testable, and extensible for future phases.

**Implementation**: Each script has a single responsibility and can be tested independently.

### 3. Data-Driven Design

**Why**: Allows adding content without modifying code, supports versioning, and enables content creators to modify game balance.

**Implementation**: Car definitions, upgrade data, and event data are stored in JSON/GDScript files.

### 4. Scene-Based Navigation

**Why**: Godot's scene system provides natural state management and memory management.

**Implementation**: GameManager manages scene transitions and state persistence.

### 5. Placeholder Asset System

**Why**: Allows development to continue without final art, with easy replacement later.

**Implementation**: Simple colored rectangles and basic sprites with clear replacement paths.

## Technical Guidelines

### Code Style

- Use GDScript 2.0+ features
- Follow Godot naming conventions (snake_case for variables/functions, CamelCase for classes)
- Keep scripts focused and under 500 lines when possible
- Use signals for communication between nodes

### Performance

- Use Texture2D resources for sprites
- Implement efficient collision detection
- Use proper node parenting for organization
- Implement object pooling for frequently created/destroyed objects

### Testing

- Test each scene individually
- Verify input mappings work correctly
- Test save/load functionality
- Check for memory leaks

## Future Considerations

### Extensibility

The architecture is designed to support:

- Online leaderboards
- Additional race types
- Multiplayer functionality
- Weather effects
- Special events
- Achievements
- Statistics
- Replays
- Mod support

### Scaling

The current foundation supports:

- Multiple car classes
- Extensive upgrade systems
- Deep customization options
- Complex career progression
- Tournament structures
- Dyno/testing facilities

## Getting Started

1. Open Godot 4.x
2. Select "Open Project"
3. Navigate to this repository
4. Press "Play" to start the game

The project is ready for Phase 1 implementation of the first playable drag race experience.