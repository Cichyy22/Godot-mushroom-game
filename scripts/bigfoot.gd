extends CharacterBody3D

var player = null

const SPEED = 2.5

@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	$animEnemy.play("Walk")
	look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z), Vector3.UP)
	move_and_slide()


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("player_collider"):
		game_manager.grabed_mushroom = 0
		game_manager.show=false
		get_tree().change_scene_to_file("res://scenes/jumpscare.tscn")
		
