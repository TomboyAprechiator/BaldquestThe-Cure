extends Button

var presssed: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if presssed == false or presssed == null:
		presssed = true
	else:
		presssed = false
	_draw()

func _draw() -> void:
	if presssed == true:
		draw_line(Vector2(0,0), Vector2(1000, 600), Color.CRIMSON, 6)
