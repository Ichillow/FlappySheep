extends CanvasLayer


# Onready
@onready var label: Label = $Label




func _ready() -> void:
	game.score = 0  # Initialise le score à 0
	label.text = str(game.score)


func add_score(points: int) -> void:

	# Ajoute des points au score
	game.score += points
	label.text = str(game.score)  # Met à jour le texte du label
