extends RigidBody2D


var shots = 1
var scored = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click") and shots > 0:
		apply_central_impulse(Vector2(get_global_mouse_position().x - position.x, abs(get_global_mouse_position().y - position.y)*-1)*5)
		shots -= 1
	if shots < 1 and shots > - 1:
		print(1)
		shots -= 1
		get_parent().get_node("Reset timer").start()


func _on_Reset_timer_timeout():
	print(2)
	get_tree().current_scene.reset_game()
	get_parent().queue_free()


func _on_Area2D_body_entered(body):
	if body == self and not scored:
		get_tree().current_scene.score += 1
		scored = true
		
