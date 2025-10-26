class_name enemy_stats
extends Resource

@export var health: int
@export var maxHealth: int
@export var speed: float
@export var damage: int

func _init(p_health = 100, p_maxHealth = 100, p_speed = 100, p_damage = 100):
	health = p_health
	maxHealth = p_maxHealth
	speed = p_speed
	damage = p_damage
