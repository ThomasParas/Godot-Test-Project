extends Line2D
class_name Trail2D

@export var target_path: NodePath
@export var max_points = 30
@export var resolution = 4.0
@onready var target: Node2D = get_node(target_path)

@export var lifetime = 0.3
var _points_creation_time = []
var _last_point = Vector2.ZERO
var _clock = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	if not target:
		target = get_parent() as Node2D
	set_as_top_level(true)
	position = Vector2.ZERO
	clear_points()

func _process(delta):
	_clock += delta
	remove_older()
	var desired_point = to_local(target.global_position)
	var distance: float = _last_point.distance_to(desired_point)
	if distance > resolution:
		add_timed_point(desired_point, _clock)
		
func add_timed_point(point: Vector2, time: float) ->  void:
	add_point(point)
	_points_creation_time.append(time)
	_last_point = point
	if get_point_count() > max_points:
		remove_first_point()
		
func remove_first_point():
	if get_point_count() > 1:
		remove_point(0)
	_points_creation_time.pop_front()
	
func remove_older() -> void:
	for creation_time in _points_creation_time:
		var delta = _clock - creation_time
		if delta > lifetime:
			remove_first_point()
		else: 
			break
