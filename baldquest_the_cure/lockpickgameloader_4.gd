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
	if PlayerInRange == "Yes":
		$Label.visible = true
	elif PlayerInRange == "No":
		$Label.visible = false

func interact():
	get_tree().current_scene._start_minigame("res://lockpicking_game.tscn",4)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		PlayerInRange = "Yes"


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		PlayerInRange = "No"
