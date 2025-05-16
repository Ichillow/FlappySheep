extends Area2D



func _on_body_entered(body:Node2D) -> void:
	if body.name == "sheep":
			var death_timer = body.get_node("deathTimer")
			game.game_over = true  # Met à jour le statut de la partie
			if death_timer:
				body.can_jump = false  # Désactive le saut
				death_timer.start(0.5)
				death_timer.timeout.connect(_on_death_timer_timeout, CONNECT_ONE_SHOT)

func _on_death_timer_timeout():
	game.gameover()  # Appelé après le délai