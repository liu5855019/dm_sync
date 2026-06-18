class_name LevelData

static func get_data_by_level(lvl: int) -> Array:
	var path = "res://tscns/level/level%s_data.gd" % lvl
	var script = load(path)
	if script == null:
		print("Failed to load level file: ", path)
		return []
	var row_dict = script.get_data()
	var result = []
	for row in row_dict.keys():
		for item in row_dict[row]:
			result.append(item)
	return result
