extends Node2D


var refills = []
var player_bullets = []
var enemy_bullets = []
var enemys = []


# Called when the node enters the scene tree for the first time.
func _ready():
	var refill = load("res://Ammo refil.tscn")
	for i in range(6):
		var refill_instance = refill.instance()
		add_child(refill_instance)
		refill_instance.position = Vector2(2000 + (500*i), 375)
		refills.append(refill_instance)
	var enemy = load("res://Turrent.tscn")
	for i in range(4):
		var enemy_instance = enemy.instance()
		add_child(enemy_instance)
		enemy_instance.position = Vector2(1500 + (500*i), -500)
		enemys.append(enemy_instance)
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.position = Vector2(5750 , -1500)
	enemys.append(enemy_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
