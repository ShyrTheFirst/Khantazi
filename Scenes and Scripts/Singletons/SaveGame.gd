extends Resource

class_name Save_data

@export var save_variables = {}


func save_the_game(variables, path = "user://data_save.tres"):
	save_variables = variables
	ResourceSaver.save(self, path)

func load_data(save_path = "user://data_save.tres"):
	if FileAccess.file_exists(save_path):
		var loaded_data = ResourceLoader.load(save_path)
		save_variables = loaded_data.save_variables
		return save_variables
