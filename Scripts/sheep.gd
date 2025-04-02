extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#Onready
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# while !Input.is_action_pressed("jump"):
	# 	velocity.y = 1

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		update_animation(true)
	if Input.is_action_just_released("jump"):
		update_animation(false)
	
	move_and_slide()

	# Animate the sheep.
func update_animation(jumping : bool) -> void:
	if jumping:
		animation_player.play("jump")
	else:
		animation_player.play("idle")

