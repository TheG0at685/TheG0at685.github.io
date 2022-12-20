extends Node2D


var refills = []
var player_bullets = []
var enemy_bullets = []
var enemys = []


var level1
var level_instance
var level = 1
var pause_menu = load("res://Pause menu.tscn")
var menu_instance = pause_menu.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	level1()
	add_child(menu_instance)
	# Draw the pause menu after everything else to put it at the front of the scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func change_level():
	remove_child(level_instance)
	menu_instance.queue_free()
	for e in enemys:
		remove_child(e)
	if level == 1 or level == 5:
		level1()
	if level == 2:
		level2()
	if level == 3:
		level3()
	if level == 4:
		level4()
	pause_menu = load("res://Pause menu.tscn")
	menu_instance = pause_menu.instance()
	add_child(menu_instance)
		
func level1():
	level1 = load("res://Level1.tscn")
	level_instance = level1.instance()
	add_child(level_instance)
	
func level2():
	level1 = load("res://Level2.tscn")
	level_instance = level1.instance()
	add_child(level_instance)
	
func level3():
	level1 = load("res://Level3.tscn")
	level_instance = level1.instance()
	add_child(level_instance)
	
func level4():
	level1 = load("res://Level4.tscn")
	level_instance = level1.instance()
	add_child(level_instance)
	for tur in level_instance.get_node("Turrents").get_used_cells():
		var turrent = load("res://Turrent.tscn")
		var turrent_instance = turrent.instance()
		add_child(turrent_instance)
		# Don't ask me why it muiltiplys by 31. It works, so we don't touch it
		turrent_instance.position = Vector2(tur.x * 31, tur.y * 31)
		enemys.append(turrent_instance)
