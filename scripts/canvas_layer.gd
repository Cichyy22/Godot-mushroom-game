extends CanvasLayer

#const HEART_ROW_SIZE = 8
#const HEART_OFFSET = 16





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$amount.text = var_to_str(game_manager.grabed_mushroom)
	if (game_manager.show == true):
		$shout.visible = true
	if (game_manager.show == false):
		$shout.visible = false
	
