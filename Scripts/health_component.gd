extends Node

signal game_over

@export var health = 100
@export var maxHealth = 100

func take_damage(damage):
	health -= damage
	if health <= 0:
		health = 0
		death()

func death():
	if get_parent().name == "Player":
		game_over.emit()
	else:
		get_parent().queue_free()
