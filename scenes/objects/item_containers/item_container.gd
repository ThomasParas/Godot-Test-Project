extends StaticBody2D
class_name ItemContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

signal open(pos, direction)
var hit_message= "hit"

func hit():
	if $LidSprite.is_visible():
		$LidSprite.hide()
		for i in range(randi_range(1,3)):
			var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
			open.emit(pos, current_direction)

