extends Node2D

@onready var player = owner.get_node("../Player")

func _process(delta: float) -> void:
	look_at(player.position)
