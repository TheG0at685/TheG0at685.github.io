extends CanvasLayer

var displaying = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func area_title(text):
	if not displaying:
		# run an animation for a title that flashes accros the screen
		displaying = true
		$ColorRect.rect_position = Vector2(-1440, -300)
		$ColorRect.visible = true
		for i in range(14):
			$ColorRect.rect_position.x += 100
		for i in range(20):
			$ColorRect.rect_position.x += 2
		print($ColorRect.rect_position)
		displaying = false
			
	
