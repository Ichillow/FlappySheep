extends Node2D

#variables
@export var barrier_scene: PackedScene  # Permet d'assigner la scène du tuyau

#onready
@onready var timer: Timer = $Timer
@onready var sheep: CharacterBody2D = $"../sheep"

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(spawn_barrier)

func _process(_delta):
	if game.game_over and timer.is_stopped() == false:
		timer.stop()

func spawn_barrier():
	if game.game_over:
		return  # Ne spawn pas si la partie est finie
	var barrier = barrier_scene.instantiate()
	barrier.position = Vector2(575	, randf_range(-578, -146))
	get_parent().add_child(barrier)
