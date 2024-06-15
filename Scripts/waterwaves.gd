extends TileMap

func _ready():
	var tiles = get_tiles_with_atlas_coords(Vector2(6, 9))
	print("Tiles with atlas coordinates (6, 9):", tiles)

func get_tiles_with_atlas_coords(coords: Vector2) -> Array:
	var tiles = []
	var used_cells = get_used_cells(1)  # Using layer index 1

	for cell in used_cells:
		var atlas_coords = get_cell_atlas_coords(1, cell)  # Using layer index 1
		if atlas_coords == Vector2i(coords):
			tiles.append(cell)

	return tiles
