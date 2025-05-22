extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#Onready
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var jump_sound: AudioStreamPlayer = $jumpSound


var can_jump: bool = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	

	if can_jump :
		jump()
	
	move_and_slide()

	# Animate the sheep.
func update_animation(jumping : bool) -> void:
	if jumping:
		animation_player.play("jump")
	else:
		animation_player.play("idle")

func jump() -> void:
	if Input.is_action_just_pressed("jump") :
		jump_sound.play()
		velocity.y = JUMP_VELOCITY
		update_animation(true)
	if Input.is_action_just_released("jump") :
		update_animation(false)

#Disable collision
func coll_off():
	collision_shape_2d.disabled=true