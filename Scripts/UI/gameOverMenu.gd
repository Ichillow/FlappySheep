extends Control




# Restart Button
func _on_texture_button_replay_pressed() -> void:
	game.game_over = false  # Reset pour la prochaine partie
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")


# Main Menu Button
func _on_texture_button_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
