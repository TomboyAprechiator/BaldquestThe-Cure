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
		$CanvasLayer/Label2.text = "He paid you half upfront and walked out of the door again before you had any chance to properly Respond.
		Thankfully you already had a lead - just that morning you'd seen a documentary about how a company back in the 70s tried to cure baldness. Didn't seem to have succeeded, of course, but there were rumors of foul play.

Their headquarters were still around, it turns out. Maybe there's something there..."
		$CanvasLayer/Button.text = "Get Going!"
		cum = true
	elif cum == true:
		get_tree().change_scene_to_file("res://the_game.tscn")
