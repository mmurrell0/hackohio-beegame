extends Node2D

@onready var player = owner.get_node("../Player")

# Have firepoint continuosly point at player, so just track the player and have fire point face player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(player.position)
