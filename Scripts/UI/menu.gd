extends Control


@onready var score: Label = $'../Score'
@onready var click_sound: AudioStreamPlayer = $'../AUDIO/clickSound'

func _ready() -> void:
	# Display the player's score
	score.text = str(game.highscore)



#Play Button
func _on_texture_button_play_pressed() -> void:
	play_sound()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")  # Change to the level scene


#Options Button
func _on_texture_button_option_pressed() -> void:
	play_sound()
	await get_tree().create_timer(0.1).timeout
	print("WIP")

#Quit Button
func _on_texture_button_quit_pressed() -> void:
	play_sound()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit(0)  # Quit the game

func play_sound():
	click_sound.play()
