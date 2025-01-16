# main.gd
extends Node2D

const GRID_SIZE = 3
const CELL_SIZE = 100
const CELL_SPACING = 10

var current_player = "X"
var game_board = []

func _ready():
	create_board()

func create_board():
	# Calculate starting position to center the board
	var start_x = (get_viewport_rect().size.x - (GRID_SIZE * (CELL_SIZE + CELL_SPACING))) / 2
	var start_y = (get_viewport_rect().size.y - (GRID_SIZE * (CELL_SIZE + CELL_SPACING))) / 2
	
	# Create the 3x3 grid
	for row in range(GRID_SIZE):
		var board_row = []
		for col in range(GRID_SIZE):
			var cell = preload("res://scenes/cell.tscn").instantiate()
			add_child(cell)
			
			# Position the cell
			var x = start_x + col * (CELL_SIZE + CELL_SPACING)
			var y = start_y + row * (CELL_SIZE + CELL_SPACING)
			cell.position = Vector2(x, y)
			
			# Connect cell signal
			cell.cell_clicked.connect(_on_cell_clicked)
			
			board_row.append(cell)
		game_board.append(board_row)

func _on_cell_clicked(cell):
	if cell.current_piece == "":  # If cell is empty
		cell.set_piece(current_player)
		# Switch players
		current_player = "O" if current_player == "X" else "X"
