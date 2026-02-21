extends Node



func _ready():
	convert_png_to_res("res://assets/Arcade - Pac-Man - Miscellaneous - General Sprites.png", "res://assets/Arcade - Pac-Man - Miscellaneous - General Sprites.res")

func convert_png_to_res(png_path: String, output_path: String):
	var source_texture = load(png_path)
	if source_texture == null:
		print("Failed to load PNG: ", png_path)
		return
	
	var image = source_texture.get_image()
	var new_texture = ImageTexture.create_from_image(image)
	
	var result = ResourceSaver.save(new_texture, output_path)
	if result == OK:
		print("Successfully saved to: ", output_path)
	else:
		print("Failed to save resource")
