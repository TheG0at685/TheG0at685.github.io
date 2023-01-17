extends KinematicBody2D


onready var doors = [$door5]
onready var mummie = load("res://Mummie.tscn")
onready var mummie_instance = mummie.instance()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
