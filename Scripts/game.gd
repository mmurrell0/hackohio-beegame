extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") && $DeathMenu.visible == false:
		$PauseMenu.visible = true
		get_tree().paused = true

func _on_game_over() -> void:
	$DeathMenu.visible = true
	get_tree().paused = true
