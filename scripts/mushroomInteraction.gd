class_name Interactible3D
extends Area3D
@onready var mushroom_test = $".."
## Base for all objects that player can interact with by pressing E (or some other button)
@onready var audioPlayer := $Pick
## Text that shows up when player hovers over the Interactible3D
@export var InteractText : String = "Press [E] to grab"

## Self-explanatory. If you have eyes, you know what it does.
@export var CanInteract : bool = true

## Emitted when player presses the "interact" action while glazing at this beautiful Interactible3D
signal OnInteract

## Override function. Called when OnInteract is fired. Does nothing, since you're supposed to override it
func _interact() -> void:
	game_manager.grabed_mushroom += 1
	audioPlayer.play()
	mushroom_test.raycast.enabled = false
	mushroom_test.position.y = -10

func _ready() -> void:
	OnInteract.connect(_interact.bind())
