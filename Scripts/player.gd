extends CharacterBody2D

signal game_over

@export_group("Player Properties")
@export var bullet_speed = 100.0
@export var player_speed = 300.0
@export var bullet : PackedScene

func _ready() -> void:
	$Wings.play("flapping")

func _physics_process(delta):
	get_movement_input()
	move_and_slide()

func _process(delta: float) -> void:
	shoot()
	
	#TODO Remove later
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT)):
		$HealthComponent.take_damage(50)

func shoot():
	var isShooting = Input.is_action_just_released("Shoot")
	if(isShooting && $AttackCooldown.is_stopped()):
		var bullet_instance = bullet.instantiate()
		owner.add_child(bullet_instance)
		bullet_instance.transform = $FirePoint.global_transform
		$AttackCooldown.start()
		$BeeBlasterSoundFX.play(0.5)

func get_movement_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * player_speed

func _on_damaged() -> void:
	# Damaged
	$Body.frame = 1
	modulate.a = 0.5
	$DamagedFrameTimer.start()
	# Stays on damaged look until timeout
	# Gives it the like street fighter look
	await $DamagedFrameTimer.timeout
	# Normal
	$Body.frame = 0
	modulate.a = 1
	$BeeBroHurt.play(0.8)

func _on_died() -> void:
	game_over.emit()
	# Or change to a different sound
	$BeeBroHurt.play(0.8)
