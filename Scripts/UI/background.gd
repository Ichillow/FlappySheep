extends Node2D

var SPEED = 75

func _process(delta: float) -> void:
	if game.game_over:
		return  # Ne bouge plus si la partie est finie
	position.x -= SPEED * delta
	
	if self.position.x < -1500:
		self.position.x = 1595
