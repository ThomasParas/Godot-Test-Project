extends Area2D

@export var speed: int = 2000

var direction: Vector2

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta


func _on_area_2d_body_entered(body):
	pass # Replace with function body.


func _on_body_entered(body):
	print("laser hit:")
	print(body)
	if is_instance_of(body, CharacterBody2D) && body.has_method("hit"):
		body.hit()
	elif is_instance_of(body, StaticBody2D) && body.has_method("hit"):
		body.hit()
	queue_free()
