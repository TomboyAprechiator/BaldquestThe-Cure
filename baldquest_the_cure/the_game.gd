extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_minigame(scene_path: String):
	$World.visible = false
	
	#clear the old game if there is one
	for child in $MinigameContainer.get_children():
		child.queue_free()
	
	var scene = load(scene_path)
	if scene:
		var instance = scene.instantiate()
		$MinigameContainer.add_child(instance)
		
	$World/Player.set_physics_process(false)
	$World/InteractableBaseObject.set_process(false)
	$World/timinggameloader.set_process(false)
func _end_minigame():
	for child in $MinigameContainer.get_children():
		child.queue_free()
	$World.visible = true
	$World/Player.set_physics_process(true)
	$World/InteractableBaseObject.set_process(true)
	$World/timinggameloader.set_process(true)
