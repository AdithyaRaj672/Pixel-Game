extends Node

# Navigation script for Phase 0 test state
# Handles returning to main menu from test state

func _ready() -> void:
    # Connect ReturnButton signal
    var return_button = $TestStateContainer/ReturnButton
    return_button.pressed.connect(_on_return_button_pressed)

func _on_return_button_pressed() -> void:
    # Transition back to main menu
    get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _input(event: InputEvent) -> void:
    # Handle menu input actions
    if event.is_action_pressed("menu_back"):
        # Return to main menu when back button is pressed
        get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")