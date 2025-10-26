extends Area2D

@export var stats: Resource

@onready var speed = stats.speed
@onready var damage = stats.damage

func _physics_process(delta):
	# '-' makes the projectile go backwards
	position -= transform.x * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Boundary")):
		queue_free()
	if(area.get_parent().is_in_group("Player")):
		area.get_parent().get_node("HealthComponent").take_damage(damage)
		queue_free()
