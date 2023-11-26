extends CharacterBody2D

@export var max_walkspeed: int = 1000
var walkspeed: int = max_walkspeed
var can_laser: bool = true
var can_grenade: bool = true

signal laser(pos, dir)
signal grenade(pos, dir)

func _ready():
	print("player loaded")
	pass

func _process(_delta):
	_input_handler()
	_player_movement()
	
func _player_movement():
	look_at(get_global_mouse_position())

func _input_handler():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * walkspeed
	move_and_slide()
	var selected_laser = $LaserStartPositions.get_children().pick_random()
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_just_pressed("primary action") and can_laser and global.laser_amount > 0:
		global.laser_amount -= 1
		print("laser")
		can_laser = false
		laser.emit(selected_laser.global_position, player_direction)
		$PrimaryTimer.start()
		$CPUParticles2D.restart()
	if Input.is_action_just_pressed("secondary action") and can_grenade and global.grenade_amount > 0:
		global.grenade_amount -= 1
		print("grenade")
		can_grenade = false
		grenade.emit(selected_laser.global_position, player_direction)
		$SecondaryTimer.start()
	if Input.is_action_just_pressed("flashlight"):
		print("flashlight")
		if not $Flashlight.enabled:
			$Flashlight.enabled = true
		else:
			$Flashlight.enabled = false

func zoom_in():
	var tween = create_tween()
	tween.tween_property($Camera2D, "zoom", Vector2(.8, .8), 1)
	
func zoom_out():
	var tween = create_tween()
	tween.tween_property($Camera2D, "zoom", Vector2(.65, .65), 2)
	
func slow_to_halt():
	var tween = create_tween()
	tween.tween_property(self, "walkspeed", 0, .5)
	
func hit():
	print("I'm hit!")
	
func _on_timer_timeout():
	can_laser = true
	print("laser reset")

func _on_secondary_timer_timeout():
	can_grenade = true
	print("grenade reset")
	
func add_item(item):
	pass


