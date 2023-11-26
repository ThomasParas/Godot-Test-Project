extends StaticBody2D
class_name ItemContainer

var hit_message: String = "hit"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hit():
	print(hit_message)
