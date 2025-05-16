# game.gd
extends Node

var game_over := false
var highscore :=0


func gameover():
	get_tree().change_scene_to_file("res://Scenes/UI/game_over_menu.tscn")

func save_highscore():
	pass


# func set_highscore() -> void:
	
