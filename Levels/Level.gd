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
	if not $UI.done_transition:
		$UI.level_transition()
		$ParallaxBackground/backdrop.visible = true
	else:
		$ParallaxBackground/backdrop.visible = false
	
func change_level(position):
	remove_child(level_instance)
	menu_instance.queue_free()
	$UI.level_transition(true)
	for e in enemys:
		remove_child(e)
	if level == 1:
		$Player.position = position
		level1()
	if level == 2:
		$Player.position = position
		level2()
	if level == 3:
		$Player.position = position
		level3()
	if level == 4:
		$Player.position = position
		level4()
	if level == 5:
		$Player.position = position
		level5()
	if level == 6:
		$Player.position = position
		level6()
		
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
	
		
func level5():
	level1 = load("res://Level5.tscn")
	level_instance = level1.instance()
	add_child(level_instance)
	
func level6():
	level1 = load("res://Level6.tscn")
	level_instance = level1.instance()
	add_child(level_instance)

