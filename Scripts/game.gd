extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") && $DeathMenu.visible == false:
		$PauseMenu.visible = true
		get_tree().paused = true

func _on_game_over() -> void:
	$DeathMenu.visible = true
	get_tree().paused = true
