extends StaticBody2D

signal player_entered_gate(body)


func _on_area_2d_body_entered(body):
	if is_instance_of(body, CharacterBody2D) && body.find_child("Camera2D", true, true):
		emit_signal("player_entered_gate", body)
