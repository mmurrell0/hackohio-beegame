extends Area2D

var speed = 800.0
var damage = 50

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_area_entered(area: Area2D) -> void:
	if(area.is_in_group("Boundary")):
		queue_free()
	if(area.get_parent().is_in_group("Enemy")):
		area.get_parent().get_node("HealthComponent").take_damage(50)
		queue_free()
