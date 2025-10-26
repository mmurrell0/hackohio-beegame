extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") && $PauseCooldown.is_stopped():
		visible = false
		get_tree().paused = false

func _on_resume_button_pressed() -> void:
	visible = false
	get_tree().paused = false

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_visibility_changed() -> void:
	$PauseCooldown.start()
