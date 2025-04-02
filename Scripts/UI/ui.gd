extends CanvasLayer


# Onready
@onready var label: Label = $Label


# Variables
var score = 0  # Score du joueur


func add_score(points: int) -> void:
	# Ajoute des points au score
	score += points
	label.text = str(score)  # Met à jour le texte du label