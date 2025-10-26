extends Area2D

var speed = 1000
var damage = 70

func _ready() -> void:
	$AnimatedSprite2D.play("flapping")

func _physics_process(delta: float) -> void:
	position -= transform.x * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Boundary")):
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	body.find_child("HealthComponent").take_damage(damage)
	queue_free()

func _on_damaged() -> void:
	pass # Replace with function body.

func _on_died() -> void:
	queue_free()
