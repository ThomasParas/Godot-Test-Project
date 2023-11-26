extends LevelParent

var player_last_coordinate: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	print("inherited onready")
	super._on_ready()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gate_player_entered_gate(body):
	if is_instance_of(body, CharacterBody2D) && body.find_child("Camera2D", true, true):
		body.slow_to_halt()
		print("player entered gate")
		TransitionLayer.change_scene("res://scenes/levels/inside.tscn")

	
