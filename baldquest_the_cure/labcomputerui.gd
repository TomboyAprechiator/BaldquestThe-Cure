extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if get_tree().current_scene.machineadjusted == true and get_tree().current_scene.machinewired == true:
		get_tree().current_scene.spawnthecure()
		get_tree().current_scene._end_minigame()
	else:
		get_tree().current_scene._end_minigame_sorrynothing()


func _on_button_2_pressed() -> void:
	get_tree().current_scene._end_minigame_sorrynothing()
