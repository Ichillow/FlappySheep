extends CanvasLayer


# Onready
@onready var label: Label = $Label


# Variables
var score = 0  # Score du joueur

func _ready() -> void:
	label.text = str(score)


func add_score(points: int) -> void:

	# Ajoute des points au score
	score += points
	label.text = str(score)  # Met à jour le texte du label

func set_highscore() -> void:
	# Met à jour le highscore si le score actuel est supérieur
	if score > game.highscore:
		game.highscore = score
		game.save_highscore()  # Sauvegarde le nouveau highscore
