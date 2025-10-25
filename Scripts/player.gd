extends CharacterBody2D

signal game_over

@export var bullet : PackedScene
var bullet_speed = 100.0

const SPEED = 300.0

func _ready() -> void:
	$Wings.play("flapping")

func _physics_process(delta):
	get_movement_input()
	move_and_slide()

func _process(delta: float) -> void:
	shoot()
	
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):
		$HealthComponent.take_damage(50)

func shoot():
	var isShooting = Input.is_action_just_released("Shoot")
	if(isShooting && $AttackCooldown.is_stopped()):
		var bullet_instance = bullet.instantiate()
		owner.add_child(bullet_instance)
		bullet_instance.transform = $FirePoint.global_transform
		$AttackCooldown.start()

func get_movement_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED


func _on_game_over() -> void:
	game_over.emit()
