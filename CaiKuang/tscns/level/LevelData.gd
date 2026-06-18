class_name LevelData

static func get_data_by_level(lvl: int) -> Array:
	var path = "res://tscns/level/level%s_data.gd" % lvl
	var script = load(path)
	if script == null:
		print("Failed to load level file: ", path)
		return []
	return script.get_data()
