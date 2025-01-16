# cell.gd
extends Area2D

signal cell_clicked(cell)

var current_piece = "" # Empty, "X", or "O"
@onready var sprite = $Sprite2D

func _ready():
	# Connect the input event
	input_event.connect(_on_input_event)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			cell_clicked.emit(self)

func set_piece(piece):
	current_piece = piece
	if piece == "X":
		sprite.texture = preload("res://assets/sprites/x_sprite.svg")
	elif piece == "O":
		sprite.texture = preload("res://assets/sprites/o_sprite.svg")
	else:
		sprite.texture = null
