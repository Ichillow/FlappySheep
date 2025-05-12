extends Control



#Play Button
func _on_texture_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")  # Change to the level scene


#Options Button
func _on_texture_button_option_pressed() -> void:
	print("WIP")

#Quit Button
func _on_texture_button_quit_pressed() -> void:
	get_tree().quit(0)  # Quit the game
