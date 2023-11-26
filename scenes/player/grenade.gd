extends RigidBody2D

@export var toss_speed: int = 600 
var direction: Vector2 = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.visible = true
	$AnimationPlayer.play("red_light")
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer2.play("flash")
	
func explode():
	$Explosion.visible = true
	$AnimationPlayer.play("Explosion")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	position += delta * direction * toss_speed
	pass
