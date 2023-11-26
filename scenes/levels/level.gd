extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/player/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/player/grenade.tscn")
var drone_scene: PackedScene = preload("res://scenes/enemies/drone.tscn")
var item_scene: PackedScene = preload("res://scenes/Items/item.tscn")

func _on_ready():
	print("level loaded")
	$UI.update_laser_text()

func _physics_process(delta):
	if not get_tree().get_nodes_in_group("enemies"):
		_spawn_new_drone()
	if get_tree().get_nodes_in_group("projectiles"):
		_clear_ammo()
			
func _clear_ammo():
	var ammo = get_tree().get_nodes_in_group("projectiles")
	for a in ammo:
		if (a.position.y < $triggers/ammo_boundary_north.position.y
		|| a.position.y > $triggers/ammo_boundary_south.position.y
		|| a.position.x < $triggers/ammo_boundary_west.position.x
		|| a.position.x > $triggers/ammo_boundary_east.position.x):
			print("removing bullet")
			a.queue_free()
	
func _spawn_new_drone():
	if $triggers/drone_spawner:
		var drone = drone_scene.instantiate() as CharacterBody2D
		drone.add_to_group("enemies")
		drone.position = $triggers/drone_spawner.position
		drone.died.connect(_spawn_item_on_enemy_death)
		$agents.add_child(drone)


func _on_player_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	$UI.update_laser_text()
	laser.add_to_group("projectiles")
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$projectiles.add_child(laser)
	

func _on_player_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	$UI.update_grenade_text()
	grenade.add_to_group("projectiles")
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.toss_speed
	$projectiles.add_child(grenade)


func _on_house_player_entered(player):
	player.zoom_in()


func _on_house_player_exited(player):
	player.zoom_out()

func _spawn_item_on_enemy_death(death_location: Vector2):
	var item = item_scene.instantiate() as Area2D
	item.position = death_location
	$projectiles.add_child(item)
	
