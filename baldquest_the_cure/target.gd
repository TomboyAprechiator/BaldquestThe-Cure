extends Node2D

var ArrowInBox = "No"
var turns = 4
@onready var arrow = get_node("../Arrow")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ArrowInBox == "Yes" and Input.is_action_just_pressed("Interact"):
		interact()

func interact():
	turns = turns - 1
	
	if turns == 0:
		get_tree().current_scene._end_minigame()
	else:
		global_position.x = randi_range(100,1050)
		arrow.SPEED = arrow.SPEED * 1.5


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Arrow":
		ArrowInBox = "Yes"


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Arrow":
		ArrowInBox = "No"
