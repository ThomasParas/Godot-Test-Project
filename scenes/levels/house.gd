extends Area2D

signal player_entered(player)
signal player_exited(player)

# Called when the node enters the scene tree for the first time.
func _ready():
	print("house loaded")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if is_instance_of(body, CharacterBody2D) && body.find_child("Camera2D", true, true):
		emit_signal("player_entered", body)

func _on_body_exited(body):
	if is_instance_of(body, CharacterBody2D) && body.find_child("Camera2D", true, true):
		emit_signal("player_exited", body)
