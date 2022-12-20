extends Camera2D



var max_roll = 10
var max_offset = Vector2(5, 5)
var amount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Change the zoom depending on the level
	if get_parent().get_parent().level == 3:
		zoom = Vector2((get_parent().position.x + 1000) / 1000, (get_parent().position.x + 1000) / 1000)
	else:
		zoom = Vector2(1, 1)
		
func shake():
	rotation = max_roll * amount * rand_range(-1, 1)
	offset.x = max_offset.x * amount * rand_range(-1, 1)
	offset.y = max_offset.y * amount * rand_range(-1, 1)
