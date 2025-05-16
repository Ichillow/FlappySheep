extends StaticBody2D

var SPEED = 200

@onready var ui: CanvasLayer = $"../UI"


func _process(delta):
	if game.game_over:
		return  # Ne bouge plus si la partie est finie
	position.x -= SPEED * delta

	if position.x < -1000:
		queue_free()

func _on_kill_1_body_entered(body) -> void:
	if body.name == "sheep":
		_handle_death(body)

func _on_kill_2_body_entered(body) -> void:
	if body.name == "sheep":
		_handle_death(body)

func _handle_death(body):
	if not game.game_over:
		game.game_over = true
		var death_timer = body.get_node("deathTimer")
		if death_timer:
			body.call_deferred("coll_off")
			body.can_jump = false
			death_timer.start(1)
			death_timer.timeout.connect(_on_death_timer_timeout, CONNECT_ONE_SHOT)

func _on_score_gate_body_entered(body: Node2D) -> void:
	if body.name == "sheep":
		ui.add_score(1)


func _on_death_timer_timeout():
	game.gameover()

