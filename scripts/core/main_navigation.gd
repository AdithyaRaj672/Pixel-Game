extends Node

# Minimal navigation script for Phase 0 - manages basic scene transitions and state
# No global GameManager needed - just navigation

func _ready() -> void:
    print("MAIN NAVIGATION READY")
    
    # Connect button signals
    var start_button = $MenuVBox/StartButton
    var quit_button = $MenuVBox/QuitButton

    start_button.pressed.connect(_on_start_button_pressed)
    quit_button.pressed.connect(_on_quit_button_pressed)

func _on_start_button_pressed() -> void:
    # Transition to Phase 0 test state - a temporary scene for navigation verification
    get_tree().change_scene_to_file("res://scenes/test_state.tscn")

func _on_quit_button_pressed() -> void:
    # Exit the game
    get_tree().quit()

func _input(event: InputEvent) -> void:
    # Handle menu input actions
    if event.is_action_pressed("menu_confirm"):
        # Simulate Start button press
        _on_start_button_pressed()
    elif event.is_action_pressed("menu_back"):
        # For Phase 0, back does nothing in main menu
        pass
    elif event.is_action_pressed("pause"):
        # Handle pause (toggle for testing)
        get_tree().paused = not get_tree().paused
        print("Game paused: " + str(get_tree().paused))