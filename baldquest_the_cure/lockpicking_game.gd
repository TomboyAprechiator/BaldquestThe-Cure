extends Node2D
var correctangle = deg_to_rad(randi_range(-80,80))
var tolerance = deg_to_rad(4)
var nearmiss = deg_to_rad(12)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Lockpick.look_at(get_global_mouse_position())
	$Lockpick.rotation += deg_to_rad(90)
	$Lockpick.rotation = clamp($Lockpick.rotation, deg_to_rad(-90), deg_to_rad(90))
	
	$Lockpick2.modulate = Color(1,0,0,0.5)
	$Lockpick2.rotation = correctangle
	
	if Input.is_action_just_pressed("Interact"):
		checksuccess()
		checknearmiss()

func checksuccess():
	var distance = abs($Lockpick.rotation - correctangle)
	if distance <= tolerance:
		win()
		
func checknearmiss():
	var distance = abs($Lockpick.rotation - correctangle)
	if distance <= nearmiss and distance > tolerance:
		heavyjiggle()
	elif distance > nearmiss:
		lightjiggle()
		
		
func lightjiggle():
	var amp = 0.05
	var tween = create_tween()
	
	tween.tween_property($Lock, "rotation", $Lock.rotation + amp, 0.05).as_relative()
	tween.tween_property($Lock, "rotation", $Lock.rotation - amp, 0.05).as_relative()
	tween.tween_property($Lock, "rotation", $Lock.rotation, 0.05).as_relative()
	tween.play()
	tween.connect("finished", Callable(tween, "queue_free"))
	
	
func heavyjiggle():
	var amp = 0.25
	var tween = create_tween()
	
	tween.tween_property($Lock, "rotation", $Lock.rotation + amp, 0.05).as_relative()
	tween.tween_property($Lock, "rotation", $Lock.rotation - amp, 0.05).as_relative()
	tween.tween_property($Lock, "rotation", $Lock.rotation, 0.05).as_relative()
	tween.play()
	tween.connect("finished", Callable(tween, "queue_free"))
	
func win():
	print("UNLOCKED; YAAAASSSS!")
	get_tree().current_scene._end_minigame()
