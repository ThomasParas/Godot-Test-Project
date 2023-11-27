extends Area2D

var item_options = ['laser', 'laser', 'health', 'grenade', 'health', 'grenade']
var type = item_options.pick_random()

var green: Color = Color("22bb58")
var blue: Color = Color("33d4ff")
var orange: Color = Color("f79239")
var is_color_chosen: bool = false

func _ready():
	$AnimationPlayer.play("Pulsate and Spin")
	if not is_color_chosen:
		set_color(type)
	
func set_color(type: String):
	match type:
		'laser':
			$Sprite2D.modulate = blue
		'grenade':
			$Sprite2D.modulate = orange
		'health':
			$Sprite2D.modulate = green
	is_color_chosen = true

func _on_body_entered(body):
	if is_instance_of(body, CharacterBody2D) && body.find_child("Camera2D", true, true):
		match type:
			'laser':
				global.laser_amount += 5
			'grenade':
				global.grenade_amount += 1
			'health':
				global.health += 10
		queue_free()
