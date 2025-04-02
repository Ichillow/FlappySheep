extends StaticBody2D

const SPEED = 200  # Vitesse de déplacement des tuyaux

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SPEED * delta  # Déplace les tuyaux vers la gauche

# Supprime les tuyaux hors écran
	if position.x < -1000:
		queue_free()
