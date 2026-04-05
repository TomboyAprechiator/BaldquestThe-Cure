extends Node2D

var pos1: Vector2
var pos2: Vector2
var helperswitch = 1
var lines = []
var connections = []
var max_lines = 5
var b1
var b2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_wirenode_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenode/Marker2D.global_position
		helperswitch = 2
		b1 = 1
		
	elif helperswitch == 2:
		pos2 = $wirenode/Marker2D.global_position
		helperswitch = 1
		b2 = 1
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenode_2_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenode2/Marker2D.global_position
		helperswitch = 2
		b1 = 2
	elif helperswitch == 2:
		pos2 = $wirenode2/Marker2D.global_position
		helperswitch = 1
		b2 = 2
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenode_3_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenode3/Marker2D.global_position
		helperswitch = 2
		b1 = 3
	elif helperswitch == 2:
		pos2 = $wirenode3/Marker2D.global_position
		helperswitch = 1
		b2 = 3
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenode_4_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenode4/Marker2D.global_position
		helperswitch = 2
		b1 = 4
	elif helperswitch == 2:
		pos2 = $wirenode4/Marker2D.global_position
		helperswitch = 1
		b2 = 4
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenode_5_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenode5/Marker2D.global_position
		helperswitch = 2
		b1 = 5
	elif helperswitch == 2:
		pos2 = $wirenode5/Marker2D.global_position
		helperswitch = 1
		b2 = 5
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenoderight_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenoderight/Marker2D.global_position
		helperswitch = 2
		b1 = 6
	elif helperswitch == 2:
		pos2 = $wirenoderight/Marker2D.global_position
		helperswitch = 1
		b2 = 6
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenoderight_2_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenoderight2/Marker2D.global_position
		helperswitch = 2
		b1 = 7
	elif helperswitch == 2:
		pos2 = $wirenoderight2/Marker2D.global_position
		helperswitch = 1
		b2 = 7
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()
	

func _on_wirenoderight_3_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenoderight3/Marker2D.global_position
		helperswitch = 2
		b1 = 8
	elif helperswitch == 2:
		pos2 = $wirenoderight3/Marker2D.global_position
		helperswitch = 1
		b2 = 8
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenoderight_4_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenoderight4/Marker2D.global_position
		helperswitch = 2
		b1 = 9
	elif helperswitch == 2:
		pos2 = $wirenoderight4/Marker2D.global_position
		helperswitch = 1
		b2 = 9
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()


func _on_wirenoderight_5_pressed() -> void:
	if helperswitch == 1:
		pos1 = $wirenoderight5/Marker2D.global_position
		helperswitch = 2
		b1 = 10
	elif helperswitch == 2:
		pos2 = $wirenoderight5/Marker2D.global_position
		helperswitch = 1
		b2 = 10
		add_line(pos1, pos2)
		_connect(b1, b2)
		queue_redraw()

func add_line(p1: Vector2, p2: Vector2):
	lines.append([p1, p2])
	
	if lines.size() > max_lines:
		lines.pop_front()
	
	queue_redraw()

func checkrightwires():
	var ordered = []
	var rightcheck1 = false
	var rightcheck2 = false
	var rightcheck3 = false
	var rightcheck4 = false
	var rightcheck5 = false
	
	for c in connections:
		var a = c[0]
		var b = c[1]
		ordered.append([min(a, b), max(a, b)])
	
	for cum in ordered:
		if [1,6] == cum:
			rightcheck1 = true
	
	for cum in ordered:
		if [2,7] == cum:
			rightcheck2 = true
	
	for cum in ordered:
		if [3,8] == cum:
			rightcheck3 = true
	
	for cum in ordered:
		if [4,9] == cum:
			rightcheck4 = true
	
	for cum in ordered:
		if [5,10] == cum:
			rightcheck5 = true
	 
	if rightcheck1 == true and rightcheck2 == true and rightcheck3 == true and rightcheck4 == true and rightcheck5 == true:
		print("Yea! You did the wires! Wooo!")
		get_tree().current_scene._end_minigame()
	else:
		print("you done fucked up boi, try again")
		#commented out code for printing the array
		#for connection in ordered:
		#	print(connection)
			
func _connect(b1, b2):
	connections.append([b1, b2])
	
	if connections.size() > max_lines:
		connections.pop_front()
		
func _draw() -> void:
	for line in lines:
		draw_line(line[0], line[1], Color.CRIMSON, 6)


func _on_button_pressed() -> void:
	for connection in connections:
		print(connection)


func _on_button_2_pressed() -> void:
	checkrightwires()
