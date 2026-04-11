extends Node2D

var poopenfarten: int
@export var fuse: bool = false
@export var powah: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_minigame(scene_path: String, kacken: int):
	$World.visible = false
	poopenfarten = kacken
	#clear the old game if there is one
	for child in $CanvasLayer/MinigameContainer.get_children():
		child.queue_free()
	
	var scene = load(scene_path)
	if scene:
		var instance = scene.instantiate()
		$CanvasLayer/MinigameContainer.add_child(instance)
		
	$World/Player.set_physics_process(false)
	$World/InteractableBaseObject.set_process(false)
	$World/timinggameloader.set_process(false)
	$World/lockpickgameloader.set_process(false)
func _end_minigame():
	for child in $CanvasLayer/MinigameContainer.get_children():
		child.queue_free()
	$World.open_door(poopenfarten)
	$World.visible = true
	$World/Player.set_physics_process(true)
	$World/InteractableBaseObject.set_process(true)
	$World/timinggameloader.set_process(true)
	$World/lockpickgameloader.set_process(true)
