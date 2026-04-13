extends Node2D
@export var TextSucess: String = "That door ough to lead outside. I have the cure, so its time to skiddaddle and get paid. See you never, creepy old building!"
@export var TextFailure: String = "I Think that door leads outside. I should go find the cure before i leave!"
var alreadyread: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		get_tree().paused = false
		get_tree().current_scene.get_node("CanvasLayer/VNText").visible = false
		get_tree().current_scene.get_node("CanvasLayer/Portrait").visible = false
		get_tree().current_scene.get_node("CanvasLayer/Label").visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and alreadyread == false and get_tree().current_scene.curegotten == true:
		get_tree().current_scene.get_node("CanvasLayer/VNText").text = TextSucess
		get_tree().current_scene.get_node("CanvasLayer/VNText").visible = true
		get_tree().current_scene.get_node("CanvasLayer/Portrait").visible = true
		get_tree().current_scene.get_node("CanvasLayer/Label").visible = true
		alreadyread=true
		get_tree().paused = true
	if body.name == "Player" and alreadyread == false and get_tree().current_scene.curegotten == false:
		get_tree().current_scene.get_node("CanvasLayer/VNText").text = TextFailure
		get_tree().current_scene.get_node("CanvasLayer/VNText").visible = true
		get_tree().current_scene.get_node("CanvasLayer/Portrait").visible = true
		get_tree().current_scene.get_node("CanvasLayer/Label").visible = true
		alreadyread=false
		get_tree().paused = true



func _on_area_2d_body_exited(body: Node2D) -> void:
	pass
