extends KinematicBody2D


var velocity = Vector2()
var speed = 300
var combo_count = 0

var dead = false

var weapon = "sword"
var spear = load("res://Spear.tscn").instance()

onready var screen_dimensions = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(spear)
	$Sword.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	danger_interaction()
	play_music()
	if not dead:
		inputs()
		weapon_stuff()
	else:
		spear.visible = false
		get_parent().game_over()
		$AudioStreamPlayer2D.pitch_scale -= 0.01
	move_and_slide(velocity)
	position.x = clamp(position.x, -screen_dimensions.x/2, screen_dimensions.x/2)
	position.y = clamp(position.y, -screen_dimensions.y/2, screen_dimensions.y/2)
	
	velocity = Vector2.ZERO

func inputs():
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("down"):
		velocity.y += speed
	
	if Input.is_action_just_pressed("sword"):
		weapon = "sword"
		
	if Input.is_action_just_pressed("spear"):
		weapon = "spear"
	
	if Input.get_joy_name(0) == "Xbox One Controller":
		rotation_degrees = Input.get_joy_axis(0, 2)*90 - 90
	else:
		look_at(get_global_mouse_position())
	
	
	
	

func weapon_stuff():
	if Input.is_action_just_pressed("attack"):
		if weapon == "sword":
			if get_parent().get_node("Beat display").cycle < len(get_parent().get_node("Beat display").song_wait_times):
				$AnimationPlayer.playback_speed = 6/get_parent().get_node("Beat display").song_wait_times[get_parent().get_node("Beat display").cycle]
			else:
				$AnimationPlayer.playback_speed = 6/get_parent().get_node("Beat display").song_wait_times[-1]
			$AnimationPlayer.play("sword swing")
			if get_parent().get_node("Beat display").on_beat:
				combo_count += 1
				$Sword.scale = Vector2(3+combo_count, 3+combo_count)
				get_parent().get_node("Camera2D").start_shake()
	
			else:
				combo_count = 0
				$Sword.scale = Vector2(1, 1)
		elif weapon == "spear":
			spear.visible = true

func play_music():
	if not $AudioStreamPlayer2D.playing:
		$AudioStreamPlayer2D.play()
	
func danger_interaction():
	for danger in get_parent().get_node("Danger").get_children():
		if $Area2D.overlaps_body(danger):
			dead = true
