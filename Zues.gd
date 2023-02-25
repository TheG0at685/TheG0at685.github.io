extends KinematicBody2D


"""Boss fight time!"""

var health = 1000
var speed = 50

var phase = 1

var velocity = Vector2()

var attack_cooldown = 120
var can_attack = true

var moving = "left"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Add Zues to the enemys
	get_parent().get_parent().enemys.append(self)
	
	# Set his position
	position = Vector2(500, -400)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hover()
	if position.distance_to(get_parent().get_parent().get_node("Player").position) < 200:
		velocity.y -= speed
	if can_attack:
		var attack = rand_range(1, 101)
		if attack < 50:
			barage()
		else:
			strike()
		can_attack = false
	if not can_attack:
		attack_cooldown -= 1
	if attack_cooldown < 0:
		can_attack = true
		if phase == 1:
			attack_cooldown = 120
		else:
			attack_cooldown = 50
	move_and_slide(velocity)
	velocity = Vector2()
	hit()
	
func strike():
	# A large, direct strike at the player
	for i in range(10):
		var bullet = load("res://Thunder_bolt.tscn")
		var bullet_instance = bullet.instance()
		get_parent().get_parent().add_child(bullet_instance)
		bullet_instance.side = "enemy"
		get_parent().get_parent().enemy_bullets.append(bullet_instance)
		bullet_instance.position = position
		bullet_instance.look_at(get_parent().get_parent().get_node("Player").position)
		bullet_instance.rotation_degrees += 180 
		
func barage():
	# Launches a barage of bullets at the player
	for i in range(10):
		var bullet = load("res://Thunder_bolt.tscn")
		var bullet_instance = bullet.instance()
		get_parent().get_parent().add_child(bullet_instance)
		bullet_instance.side = "enemy"
		get_parent().get_parent().enemy_bullets.append(bullet_instance)
		bullet_instance.position = position
		bullet_instance.look_at(get_parent().get_parent().get_node("Player").position)
		bullet_instance.rotation_degrees += 180 + i*2
		
func hover():
	if moving == "left":
		velocity.x -= speed * 4
	else:
		velocity.x += speed * 4
	if moving == 'left' and position.x < -100:
		moving = "right"
	elif moving == 'right' and position.x > 900:
		moving = "left"
			
			
func hit():
	for bullet in get_parent().get_parent().player_bullets:
		if $Collision.overlaps_area(bullet.get_node("Collision")):
			health -= 1
	if health < 500:
		phase = 2
	if health < 0 :
		queue_free()
	
	
