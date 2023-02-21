extends Control

onready var enemys = get_parent().enemys
var on_beat = false
var cycle = 0
var song_wait_times = [0.9]



var has_beat_attacked = false

var recording = false

var last_click

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if recording:
		$"Recording Timer".start()
		last_click = $"Recording Timer".time_left


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	adjust_particles()
	if cycle > len(song_wait_times)-1:
		cycle = 0
	
	# Lose the combo bonus if you miss a beat
	if on_beat and has_beat_attacked == false:
		if Input.is_action_just_pressed("attack"):
			has_beat_attacked = true
			
	if recording:
		if Input.is_action_just_pressed("attack"):
			print(song_wait_times)
			song_wait_times.append(last_click-$"Recording Timer".time_left)
			last_click = $"Recording Timer".time_left
			
			
	

func _on_Beat_cooldown_timeout():
	if not get_parent().showed_game_over:
		randomize()
		$"Beat cooldown".wait_time = song_wait_times[cycle]
		cycle += 1
		$"Beat cooldown".start()
		$"beat length".start()
		$CanvasLayer/ColorRect.show()
		var rgb_flash = round(rand_range(1, 3))
		if rgb_flash == 1:
			$CanvasLayer/ColorRect.color.r = 255
		elif rgb_flash == 2:
			$CanvasLayer/ColorRect.color.g = 255
		else:
			$CanvasLayer/ColorRect.color.b = 255
		on_beat = true
	else:
		$CanvasLayer/ColorRect.hide()
		$CanvasLayer/ColorRect.color.r = 0
		$CanvasLayer/ColorRect.color.g = 0
		$CanvasLayer/ColorRect.color.b = 0


func _on_beat_length_timeout():
	randomize()
	if not has_beat_attacked:
		get_parent().get_node("Player").combo_count = 0
	has_beat_attacked = false
	$CanvasLayer/ColorRect.hide()
	$CanvasLayer/ColorRect.color.r = 0
	$CanvasLayer/ColorRect.color.g = 0
	$CanvasLayer/ColorRect.color.b = 0
	on_beat = false
	if round(rand_range(1, 10)) == 5:
		get_parent().get_node("Danger").attack()

func adjust_particles():
	if not $CanvasLayer/Particles2D.emitting:
		$CanvasLayer/Particles2D.amount = 100 * len(enemys)
		$CanvasLayer/Particles2D.emitting = true

func update_score(points):
	score += points
	$CanvasLayer/CanvasLayer/Score.text = str(score)
	$AnimationPlayer.play("score pop")
