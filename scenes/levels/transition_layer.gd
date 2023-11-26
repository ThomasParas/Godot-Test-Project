extends CanvasLayer

var transparent: Color = Color(1,1,1,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.color = transparent


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_scene(target: String) -> void:
	$AnimationPlayer.play("fade_to_black")
	await $AnimationPlayer.animation_finished
	global.goto_scene(target)
	$AnimationPlayer.play_backwards("fade_to_black")
	
