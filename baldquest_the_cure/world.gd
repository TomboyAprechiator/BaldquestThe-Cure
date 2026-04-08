extends Node2D

var roommarker = preload("res://room_marker.tscn")
var roomheight = 648
var roomwidth = 1152
var roomcols = 5
var roomrows = 5
var rooms = []
@onready var camera = $Camera2D
var horizontal_trigger_scene: PackedScene = preload("res://horizontal_trigger.tscn")
var vertical_trigger_scene: PackedScene = preload("res://vertical_trigger.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for y in range(roomrows):
		for x in range(roomcols):
			var room = roommarker.instantiate()
			add_child(room)
			room.position = Vector2(x*roomwidth+roomwidth*0.5,y*roomheight+roomheight*0.5)
			rooms.append(room)

# --- Create triggers for all rooms ---
	for y in range(roomrows):
		for x in range(roomcols):
			var index = y * roomcols + x
			var marker = rooms[index]

			# Right trigger
			if x < roomcols - 1:
				var right_trigger = horizontal_trigger_scene.instantiate()
				add_child(right_trigger)
				right_trigger.position = Vector2((x + 1) * roomwidth, y * roomheight)
				right_trigger.target_marker = rooms[index + 1]
				right_trigger.camera = camera
				

			# Left trigger
			if x > 0:
				var left_trigger = horizontal_trigger_scene.instantiate()
				add_child(left_trigger)
				left_trigger.position = Vector2(x * roomwidth - 8, y * roomheight)
				left_trigger.target_marker = rooms[index - 1]
				left_trigger.camera = camera
				

			# Down trigger
			if y < roomrows - 1:
				var down_trigger = vertical_trigger_scene.instantiate()
				add_child(down_trigger)
				
				down_trigger.position = Vector2(x * roomwidth, (y + 1) * roomheight)
				down_trigger.target_marker = rooms[index + roomcols]
				down_trigger.camera = camera

			# Up trigger
			if y > 0:
				var up_trigger = vertical_trigger_scene.instantiate()
				add_child(up_trigger)
				up_trigger.position = Vector2(x * roomwidth, y * roomheight - 12)
				up_trigger.target_marker = rooms[index - roomcols]
				up_trigger.camera = camera
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_room_2_enter_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_room_1_enter_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
