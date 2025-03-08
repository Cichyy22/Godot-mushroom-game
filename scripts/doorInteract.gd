extends Interactible3D

## Override function. Called when OnInteract is fired. Does nothing, since you're supposed to override it
func _interact() -> void:
	if (game_manager.grabed_mushroom < 25):
		game_manager.show=true
		await get_tree().create_timer(1.0).timeout
		game_manager.show=false
		print("Potrzebujesz 50 grzybów aby wrócić do domu")
	else:
		game_manager.grabed_mushroom = 0
		game_manager.show=false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
