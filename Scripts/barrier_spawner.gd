extends Node2D

#variables
@export var barrier_scene: PackedScene  # Permet d'assigner la scène du tuyau

#onready
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.timeout.connect(Callable(self, "spawn_barrier"))  # Connecte le timer à la fonction de spawn

func spawn_barrier():
	var barrier =  barrier_scene.instantiate() # Crée un nouveau tuyau
	barrier.position = Vector2(800, randf_range(-578, -146))  # Position aléatoire en hauteur
	get_parent().add_child(barrier)  # Ajoute le tuyau à la scène
	