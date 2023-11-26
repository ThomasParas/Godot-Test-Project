extends LevelParent


# Called when the node enters the scene tree for the first time.
func _ready():
	if $agents/Player:
		$agents/Player.zoom_in()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_gate_area_body_entered(body):
	if is_instance_of(body, CharacterBody2D) && body.find_child("Camera2D", true, true):
		body.slow_to_halt()
		print("player entered gate")
		TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
