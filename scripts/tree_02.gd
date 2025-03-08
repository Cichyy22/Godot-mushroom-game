extends Node3D

@onready var raycast = $RayCast3D

func _physics_process(delta):
	if raycast.is_colliding():
		var ground_position = raycast.get_collision_point()
		# Ustawiamy tylko wysokość (Y) obiektu
		global_transform.origin.y = ground_position.y
