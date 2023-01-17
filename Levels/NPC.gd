extends KinematicBody2D



var times_spoken = 0
var speaking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if speaking and Input.is_action_just_pressed("jump"):
		close_dialog()
	if Input.is_action_just_pressed("jump"):
		speaking = true
		speak()
		

func show_diolauge(text):
	get_parent().get_node("UI/PopupDialog").visible = true
	get_parent().get_node("UI/PopupDialog/ColorRect/Diolayge").text = text
	get_parent().get_node("UI/PopupDialog/ColorRect2/Name").text = "Zeus"
	
func close_dialog():
	speaking = false
	get_parent().get_node("UI/PopupDialog").visible = false
	
func speak():
	times_spoken += 1
	# the diolauge tree
	if times_spoken == 1:
		show_diolauge("You have done well to pass my trial.")
	if times_spoken > 1:
		show_diolauge("You are ready to rescue the other olympians. Now go.")

