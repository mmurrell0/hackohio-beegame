extends CharacterBody2D

@export var bullet : PackedScene
@export var stats: Resource

func _ready() -> void:
	$Wings.play("flapping")
# MAYBE ADD FUNCTION FOR POWER UP DROPS
# Projectile shoots straight at player then stays on that course'

func _process(delta: float) -> void:
	shoot()

func shoot():
	if($AttackCooldown.is_stopped()):
		var bullet_instance = bullet.instantiate()
		owner.add_child(bullet_instance)
		bullet_instance.transform = $FirePoint.global_transform
		$AttackCooldown.start()
		$Shoot.play(0.4)

func _on_died() -> void:
	owner.find_child("Death").play(0.5)
	queue_free()

func _on_damaged() -> void:
	modulate.a = 0.5
	$FlashDuration.start()
	await $FlashDuration.timeout
	modulate.a = 1
