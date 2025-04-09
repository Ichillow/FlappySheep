extends StaticBody2D

const SPEED = 200  # Vitesse de déplacement des tuyaux

#onready
@onready var ui: CanvasLayer = $"../UI"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SPEED * delta  # Déplace les tuyaux vers la gauche

# Supprime les tuyaux hors écran
	if position.x < -1000:
		queue_free()


func _on_kill_1_body_entered(other_body) -> void:
	if other_body.name == "sheep":
		var death_timer = other_body.get_node("deathTimer")
		if death_timer:
			other_body.can_jump = false  # Désactive le saut
			death_timer.start(1)
			death_timer.timeout.connect(_on_death_timer_timeout, CONNECT_ONE_SHOT)

func _on_kill_2_body_entered(other_body) -> void:
	if other_body.name == "sheep":
		var death_timer = other_body.get_node("deathTimer")
		if death_timer:
			other_body.can_jump = false  # Désactive le saut
			death_timer.start(1)
			death_timer.timeout.connect(_on_death_timer_timeout, CONNECT_ONE_SHOT)

func _on_death_timer_timeout():
	reload_scene()  # Appelé après le délai

func _on_score_gate_body_entered(body: Node2D) -> void:
	if body.name == "sheep":
		ui.add_score(1)  # Ajoute 1 point au score

func reload_scene():
	get_tree().reload_current_scene()
