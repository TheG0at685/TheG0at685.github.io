extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	door_open()

func door_open():
	for door in get_parent().level_instance.doors:
		# Change the y position based off of closnes to the nearest door
		$MeshInstance2D.position.y = get_distance_to_closesed_door()*5
		if $MeshInstance2D.position.y < 450:
			$MeshInstance2D.position.y = 450
	
func factorial(n):
	var holdvalue = 0
	var boolis = true
	if n == 0 or n == 1:
		holdvalue = 1
	else:
		while n > 0:
			if boolis:
				boolis = false
				holdvalue = n
			else:
				holdvalue = holdvalue * n
			n = n-1
	return holdvalue
	
func get_distance_to_closesed_door():
	var dist = 10000000
	var temp_dist = 0
	for door in get_parent().level_instance.doors:
		temp_dist = get_parent().get_node("Player").position.distance_to(door.position)
		if temp_dist < dist:
			dist = temp_dist
	return dist
