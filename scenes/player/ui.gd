extends CanvasLayer

# colors
var green: Color = Color("22bb58")
var yellow: Color = Color("e5f214")
var red: Color = Color("e11d3e")
var health_low_red: Color = Color("fc0034")
var white: Color = Color("ffffff")

@onready var laser_label: Label = $LaserCounter/VBoxContainer/LaserLabel
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/GrenadeLabel
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $ProgressBarController/ProgressBar

func _ready():
	global.connect("stat_change", update_ui)
	update_ui()
	
func update_ui():
	update_laser_text()
	update_grenade_text()
	update_health_text()
	
func update_laser_text():
	laser_label.text = str(global.laser_amount)
	if global.laser_amount > 6:
		laser_label.modulate = green
		laser_icon.modulate = green
	elif global.laser_amount > 0:
		laser_label.modulate = yellow
		laser_icon.modulate = yellow
	else:
		laser_label.modulate = red
		laser_icon.modulate = red
	
func update_grenade_text():
	grenade_label.text = str(global.grenade_amount)
	if global.grenade_amount > 2:
		grenade_label.modulate = green
		grenade_icon.modulate = green
	elif global.grenade_amount > 0:
		grenade_label.modulate = yellow
		grenade_icon.modulate = yellow
	else: 
		grenade_label.modulate = red
		grenade_icon.modulate = red
		
func update_health_text():
	health_bar.value = global.health
	if health_bar.value > 30:
		$ProgressBarController/ProgressBar.tint_progress = white
	else: 
		$ProgressBarController/ProgressBar.tint_progress = health_low_red
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
