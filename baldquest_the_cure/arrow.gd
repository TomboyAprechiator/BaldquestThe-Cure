extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	move_and_slide()





func _on_turnaround_body_entered(body: Node2D) -> void:
	if direction == Vector2.RIGHT:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT 


func _on_turnaround_2_body_entered(body: Node2D) -> void:
	if direction == Vector2.RIGHT:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT 
