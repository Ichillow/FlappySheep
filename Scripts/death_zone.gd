extends Area2D


func _on_body_entered(body:Node2D) -> void:
	if body.name == "sheep":
		var death_timer = body.get_node("deathTimer")
		if death_timer:
			death_timer.start(0.4)
			death_timer.timeout.connect(_on_death_timer_timeout, CONNECT_ONE_SHOT)

func _on_death_timer_timeout():
	reload_scene()  # Appelé après le délai

func reload_scene():
	get_tree().reload_current_scene()
