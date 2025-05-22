# game.gd
extends Node



var game_over := false
var highscore :=0
var score := 0

func gameover():
	game_over = false  # Met à jour le statut de la partie
	set_highscore()
	get_tree().change_scene_to_file("res://Scenes/UI/game_over_menu.tscn")

func save_highscore():
	pass


func set_highscore() -> void:
	# Met à jour le highscore si le score actuel est supérieur
	if score > highscore:
		highscore = score
		save_highscore()  # Sauvegarde le nouveau highscore
