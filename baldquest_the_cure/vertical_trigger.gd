extends Area2D

@export var camera: Camera2D
@export var target_marker: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	camera.global_position = target_marker.global_position
	print("Body Enter!")
