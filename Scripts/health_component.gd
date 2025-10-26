extends Node

signal died
signal damaged

@export var health = 100
@export var maxHealth = 100

func take_damage(damage):
	health -= damage
	damaged.emit()
	if health <= 0:
		health = 0
		death()

func death():
	died.emit()
