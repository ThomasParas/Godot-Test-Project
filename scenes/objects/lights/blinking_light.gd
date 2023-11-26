extends StaticBody2D

@onready var longtimer = $LongTimer
@onready var shorttimer = $ShortTimer
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	start_blinking()
#	print("ready called")


func light_on(on : bool):
	$PointLight2D.enabled = on

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_blinking():
#	print("start blinking")
	$LongTimer.start()
	
#func flicker():
#	print("in flicker")
#	for i in range(3,10):
#		print("yup")
#		light_on(false)
#		$ShortTimer.set_wait_time(randf_range(.05,.1))
#		$ShortTimer.start()
#		await $ShortTimer.timeout
#		light_on(true)
#	$LongTimer.start()

func _on_long_timer_timeout():
#	flicker()
	light_on(false)
	$ShortTimer.start()


func _on_short_timer_timeout():
	light_on(true)
	start_blinking()
