extends Camera2D

var shake_duration = 0.5
var shake_amplitude = 3.0
var shake_timer = 0.0
var shake_offset = Vector2.ZERO

func _process(delta):
	if shake_timer > 0:
		shake_offset = Vector2(rand_range(-shake_amplitude, shake_amplitude), rand_range(-shake_amplitude, shake_amplitude))
		global_position += shake_offset
		shake_timer -= delta
	else:
		shake_offset = Vector2.ZERO
		position = Vector2(0, 0)

func start_shake():
	rand_seed(OS.get_system_time_msecs())
	shake_timer = shake_duration

