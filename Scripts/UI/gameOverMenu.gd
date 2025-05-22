extends Control


@onready var high_score: Label = $'../HighScore'
@onready var score: Label = $'../Score'
@onready var click_sound: AudioStreamPlayer = $'../AUDIO/clickSound'

func _ready() -> void:
	# Affiche le score du joueur
	high_score.text = str(game.highscore)
	score.text = str(game.score)
# Restart Button
func _on_texture_button_replay_pressed() -> void:
	play_sound()
	await get_tree().create_timer(0.1).timeout
	game.game_over = false  # Reset pour la prochaine partie
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")


# Main Menu Button
func _on_texture_button_main_menu_pressed() -> void:
	play_sound()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")


func play_sound():
	click_sound.play()