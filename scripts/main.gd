extends Node3D

@export var mushroom_scene: PackedScene  # Scena grzyba (Mushroom.tscn)
@export var spawn_area: Node3D           # Marker3D jako punkt odniesienia
@export var ground: MeshInstance3D       # Mesh, na którym generujemy obiekty
@export var mushroom_count: int = 10     # Liczba generowanych grzybów
@export var spawn_height: float = 5.0    # Wysokość, na której początkowo generujemy obiekt

func _ready():
	call_deferred("spawn_mushrooms", mushroom_count)

func spawn_mushrooms(count: int):
	var ground_size = ground.get_aabb().size  # Pobieramy rozmiar powierzchni
	var ground_pos = ground.global_transform.origin  # Pobieramy globalną pozycję
	print(ground_pos)
	var min_x = ground_pos.x - ground_size.x / 2
	var max_x = ground_pos.x + ground_size.x / 2
	var min_z = ground_pos.z - ground_size.z / 2
	var max_z = ground_pos.z + ground_size.z / 2

	for i in range(count):
		var mushroom = mushroom_scene.instantiate()  # Tworzymy nowy grzyb

		# Losowa pozycja na powierzchni
		var random_x = randf_range(min_x, max_x)
		var random_z = randf_range(min_z, max_z)
		var spawn_position = Vector3(random_x, ground_pos.y + spawn_height, random_z)

		# Przypisujemy pozycję startową
		mushroom.global_transform.origin = spawn_position
		add_child(mushroom)  # Dodajemy grzyba do sceny
