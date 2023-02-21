extends Node2D


var enemys = []

var round_counter = 1

var showed_game_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	round_counter += 1



func _on_Enemy_spawn_timeout():
	var enemy = load("res://Enemy.tscn")
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	$"Enemy spawn".wait_time = 5/round((round_counter/1000)+1)
	$"Enemy spawn".start()

func game_over():
	if not showed_game_over:
		add_child(load("res://Game over.tscn").instance())
		showed_game_over = true
