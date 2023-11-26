extends Node

var laser_amount = 20
var grenade_amount = 5


func goto_scene(path: String):
	_deferred_goto_scene.call_deferred(path)

func _deferred_goto_scene(path: String):
	# Immediately free the current scene. There is no risk here because the
	# call to this method is already deferred.
	get_tree().current_scene.free()
	var packed_scene := ResourceLoader.load(path) as PackedScene
	var instanced_scene := packed_scene.instantiate()
	# Add it to the scene tree, as direct child of root
	get_tree().root.add_child(instanced_scene)
	# Set it as the current scene, only after it has been added to the tree
	get_tree().current_scene = instanced_scene
