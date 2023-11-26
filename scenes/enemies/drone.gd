extends CharacterBody2D

signal died(position: Vector2)
const SPEED = 200

func _ready():
	pass

func _physics_process(delta):
	var direction = Vector2.RIGHT
	# Add the gravity.
	velocity = direction * SPEED
	move_and_slide()
	
func hit():
	print("hit")
	$AnimationPlayer.play("explode")

func emit_died():
	emit_signal("died", position)
