extends Node2D


onready var game = load("res://game.tscn")
onready var game_instance = game.instance()

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	reset_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$score.text = str(score)

func reset_game():
	
	var game = load("res://game.tscn")
	var game_instance = game.instance()
	add_child(game_instance)
