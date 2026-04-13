extends Node2D

var poopenfarten: int
@export var fuse: bool = false
@export var powah: bool = false
@export var machineadjusted: bool = false
@export var machinewired: bool = false
@export var curegotten: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _start_minigame(scene_path: String, kacken: int):
	$World.visible = false
	$CanvasLayer/Label.visible = false
	$CanvasLayer/Portrait.visible = false
	$CanvasLayer/VNText.visible = false
	poopenfarten = kacken
	#clear the old game if there is one
	for child in $CanvasLayer/MinigameContainer.get_children():
		child.queue_free()
	
	var scene = load(scene_path)
	if scene:
		var instance = scene.instantiate()
		$CanvasLayer/MinigameContainer.add_child(instance)
		
	$World/Player.set_physics_process(false)
	$World/timinggameloader.set_process(false)
	$World/lockpickgameloader2.set_process(false)
	$World/lockpickgameloader3.set_process(false)
	$World/lockpickgameloader4.set_process(false)
	$World/lockpickgameloader5.set_process(false)
	$World/lockpickgameloader.set_process(false)
	$World/timinggameloader2.set_process(false)
func _end_minigame():
	for child in $CanvasLayer/MinigameContainer.get_children():
		child.queue_free()
	$World.open_door(poopenfarten)
	$World.visible = true
	$World/Player.set_physics_process(true)
	$World/timinggameloader.set_process(true)
	$World/timinggameloader2.set_process(true)
	$World/lockpickgameloader.set_process(true)
	$World/Player.set_physics_process(true)
	$World/timinggameloader.set_process(true)
	$World/lockpickgameloader2.set_process(true)
	$World/lockpickgameloader3.set_process(true)
	$World/lockpickgameloader4.set_process(true)
	$World/lockpickgameloader5.set_process(true)
	$World/lockpickgameloader.set_process(true)
	$World/timinggameloader2.set_process(true)
func _end_minigame_sorrynothing():
	for child in $CanvasLayer/MinigameContainer.get_children():
		child.queue_free()
	$World.visible = true
	$World/Player.set_physics_process(true)
	$World/timinggameloader.set_process(true)
	$World/timinggameloader2.set_process(true)
	$World/lockpickgameloader.set_process(true)
	$World/Player.set_physics_process(true)
	$World/timinggameloader.set_process(true)
	$World/lockpickgameloader2.set_process(true)
	$World/lockpickgameloader3.set_process(true)
	$World/lockpickgameloader4.set_process(true)
	$World/lockpickgameloader5.set_process(true)
	$World/lockpickgameloader.set_process(true)
	$World/timinggameloader2.set_process(true)
	
func spawnthecure():
	$World/TheCure.visible = true
	$World/TheCure.set_process(true)
	
func show_vn(text: String):
	$CanvasLayer/VNText.text = text
	$CanvasLayer/VNText.visible = true
	$CanvasLayer/Portrait.visible = true
	$CanvasLayer/Label.visible = true
	
func show_popup(text: String):
	$CanvasLayer/PopupPanel/Label.text = text
	$CanvasLayer/PopupPanel.visible = true

func _on_button_pressed() -> void:
	$CanvasLayer/PopupPanel.visible = false
