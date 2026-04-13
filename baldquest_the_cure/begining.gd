extends Node2D

var cum: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if cum == false:
		$CanvasLayer/Label2.text = "You already had a lead, thankfully - just that morning you'd seen a documentary about how a company back in the 70's tried to cure baldness. Didnt seem to have succeded, of course, but there were rumours of Foul Play.

Their Headquaters were still around, it turns out. Maybe there's something there..."
		$CanvasLayer/Button.text = "Get Going!"
		cum = true
	elif cum == true:
		get_tree().change_scene_to_file("res://the_game.tscn")
