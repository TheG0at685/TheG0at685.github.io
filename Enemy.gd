extends KinematicBody2D


onready var player = get_parent().get_node("Player")

onready var screen_dimensions = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))

var rng = RandomNumberGenerator.new()
var speed = 100

var bled = false
var bleeding


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	rand_seed(OS.get_system_time_msecs())
	get_parent().enemys.append(self)
	var spawn_method = round(rand_range(1, 2))
	if spawn_method == 1:
		if round(rand_range(1, 2)) == 1:
			position.x = screen_dimensions.x
		else:
			position.x = -screen_dimensions.x
		position.y = rand_range(-screen_dimensions.y, screen_dimensions.y)
	else:
		if round(rand_range(1, 2)) == 1:
			position.y = screen_dimensions.y
		else:
			position.y = -screen_dimensions.y
		position.x = rand_range(-screen_dimensions.x, screen_dimensions.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(player.position)
	position += transform.x * speed * delta
	if bleeding and not $Particles2D.emitting:
		bled = true
		$Particles2D.emitting = true
	for danger in get_parent().get_node("Danger").get_children():
		
		if $Collision.overlaps_area(player.get_node("Sword/Area2D")) and player.get_node("Sword").visible or ($Collision.overlaps_area(player.spear.get_node("Area2D")) and player.spear.visible and player.spear.fierd) or $Collision.overlaps_body(danger):
			position -= transform.x * speed * delta * 10
			if not $Particles2D.emitting:
				$Particles2D.emitting = true
				bleeding = true
			else:
				if bled:
					get_parent().enemys.erase(self)
					get_parent().get_node("Beat display").update_score(1000)
					queue_free()
	if $Collision.overlaps_body(player) and not player.dead:
		player.dead = true
		$Particles2D.emitting = true
