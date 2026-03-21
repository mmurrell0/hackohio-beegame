extends Node

signal died
signal damaged

@export var stats: Resource

@onready var health = stats.health
@onready var maxHealth = stats.maxHealth

func take_damage(damage):
	health -= damage
	#TODO Remove later
	print_debug("Took damage: " + str(damage))
	damaged.emit()
	if health <= 0:
		health = 0
		death()

func death():
	died.emit()
