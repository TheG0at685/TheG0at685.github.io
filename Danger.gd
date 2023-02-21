extends StaticBody2D


var attacking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $AnimationPlayer.is_playing():
		attacking = false
		visible = false

func attack():
	randomize()
	if not attacking:
		visible = true
		attacking = true
		var Attack = round(rand_range(1, 3))
		if Attack == 1:
			triple_saw()
		elif Attack == 2:
			plus()

func triple_saw():
	$AnimationPlayer.playback_speed = 0.2
	$AnimationPlayer.play("triple saw")
	
func plus():
	$AnimationPlayer.playback_speed = 0.2
	$AnimationPlayer.play("plus")
