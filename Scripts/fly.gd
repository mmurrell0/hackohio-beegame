extends Area2D

@export var stats: Resource

@onready var speed = stats.speed
@onready var damage = stats.damage

func _ready() -> void:
	$AnimatedSprite2D.play("flapping")
	$Traveling.play(0.4)

func _physics_process(delta: float) -> void:
	position -= transform.x * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Boundary")):
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	body.find_child("HealthComponent").take_damage(damage)
	queue_free()

func _on_damaged() -> void:
	modulate.a = 0.5
	$FlashDuration.start()
	await $FlashDuration.timeout
	modulate.a = 1

func _on_died() -> void:
	owner.find_child("Death").play(0.55)
	queue_free()
