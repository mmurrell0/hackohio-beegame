extends CharacterBody2D

var bullet = preload("res://Scenes/bullet.tscn")
var bullet_speed = 100.0

const SPEED = 300.0

func _physics_process(delta):
	get_movement_input()
	move_and_slide()

func _process(delta: float) -> void:
	shoot()

func shoot():
	var isShooting = Input.is_action_just_released("Shoot")
	if(isShooting):
		var bullet_instance = bullet.instantiate()
		add_child(bullet_instance)
		bullet_instance.transform = $FirePoint.global_transform

func get_movement_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED
