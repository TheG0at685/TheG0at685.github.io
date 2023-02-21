extends KinematicBody2D


var fierd = false
var speed = 15
var returning = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not get_parent().weapon == "spear":
		visible = false
	if Input.is_action_just_pressed("attack"):
		fierd = true
		if get_parent().get_parent().get_node("Beat display").on_beat:
			scale = Vector2(3, 3)
		else:
			scale = Vector2(1, 1)
		
	if not fierd:
		look_at(get_global_mouse_position())
	else:
		position += transform.x * speed
		
	if position.distance_to(Vector2(0, 0)) > 1500:
		returning = true
		
	if returning:
		scale = Vector2(1, 1)
		position = Vector2(0, 0)
		returning = false
		fierd = false
			
