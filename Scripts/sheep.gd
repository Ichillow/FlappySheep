extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

#Onready
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var direction := Input.get_axis("jump", "nothing")
	print(direction)
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	

	velocity.x = SPEED
	
	update_animation(direction)
	move_and_slide()

func update_animation(dir) -> void:
	if dir == -1:
		animation_player.play("jump")
	elif dir == 0:
		animation_player.play("idle")

