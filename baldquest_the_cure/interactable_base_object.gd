extends Node2D

@export var interact_text := "Press E to interact"
@export var PlayerInRange := "No"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PlayerInRange == "Yes" and Input.is_action_just_pressed("Interact"):
		interact()

func interact():
	get_tree().change_scene_to_file("res://minigame_scene_base.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		PlayerInRange = "Yes"


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		PlayerInRange = "No"
