extends Node3D

@onready var camera_shake = $Awoo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Awoo/AudioStreamPlayer3D.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	camera_shake._camera_shake()
	

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
