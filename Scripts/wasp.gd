extends CharacterBody2D

@export var bullet : PackedScene
@export var stats: Resource

func _ready() -> void:
	$AnimatedSprite2D.play("flapping")
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

func _on_died() -> void:
	queue_free()

func _on_damaged() -> void:
	pass # Replace with function body.
