# extends Node

class_name LevelData


static  func get_data_by_level(lvl: int) -> Array:
	if lvl <= 1:
		return _get_level1_data()
	return [] # 其他等级的数据暂时返回空数组，后续可以根据需要添加更多等级的数据


static func _get_level1_data() -> Array:
	var data_list: Array = [
		PlayerData.new(1, Vector2(3, 12)),
		PlayerData.new(1, Vector2(4, 12)),
		OreData.new(10, Vector2(0, 0)),
		OreData.new(1, Vector2(1, 0)),
		OreData.new(2, Vector2(1, 1)),
		OreData.new(2, Vector2(1, 2)),
		OreData.new(3, Vector2(1, 3)),
		OreData.new(4, Vector2(1, 4)),
		OreData.new(5, Vector2(1, 5)),
		OreData.new(6, Vector2(1, 6)),

		# 7 row, level = 3
		OreData.new(3, Vector2(0, 7)),
		OreData.new(3, Vector2(1, 7)),
		OreData.new(3, Vector2(2, 7)),
		OreData.new(3, Vector2(3, 7)),
		OreData.new(3, Vector2(4, 7)),
		OreData.new(3, Vector2(5, 7)),
		OreData.new(3, Vector2(6, 7)),
		OreData.new(3, Vector2(7, 7)),

		# 8 row, level = 2
		OreData.new(2, Vector2(0, 8)),
		OreData.new(2, Vector2(1, 8)),
		OreData.new(2, Vector2(2, 8)),
		OreData.new(2, Vector2(3, 8)),
		OreData.new(2, Vector2(4, 8)),
		OreData.new(2, Vector2(5, 8)),
		OreData.new(2, Vector2(6, 8)),
		OreData.new(2, Vector2(7, 8)),

		# 9 row
		OreData.new(1, Vector2(0, 9)),
		OreData.new(1, Vector2(1, 9)),
		OreData.new(1, Vector2(2, 9)),
		OreData.new(1, Vector2(3, 9)),
		OreData.new(1, Vector2(4, 9)),
		OreData.new(1, Vector2(5, 9)),
		OreData.new(1, Vector2(6, 9)),
		OreData.new(1, Vector2(7, 9)),

		# 石头墙壁
		StoneData.new(Vector2(0, 1)),
		StoneData.new(Vector2(0, 2)),
		StoneData.new(Vector2(0, 3)),
		StoneData.new(Vector2(0, 4)),
		StoneData.new(Vector2(0, 5)),
		StoneData.new(Vector2(0, 6))
	]
	return data_list







# func save_data() -> void:
# 	var data_list = [
# 		PlayerData.new(1, Vector2(4, 12)),
# 		PlayerData.new(1, Vector2(5, 12)),
# 		OreData.new(1, Vector2(0, 0)),
# 		OreData.new(1, Vector2(1, 0)),
# 		OreData.new(2, Vector2(1, 1)),
# 		OreData.new(2, Vector2(1, 2)),
# 		OreData.new(3, Vector2(1, 3)),
# 		OreData.new(4, Vector2(1, 4)),
# 		OreData.new(5, Vector2(1, 5)),
# 		OreData.new(6, Vector2(1, 6))
# 	]
	

# 	# 将对象列表转换为字典列表
# 	var json_array = []
# 	for item in data_list:
# 		var item_dict = {
# 			"type": item.type,  # 记录对象类型，方便加载时区分
# 			"position": [item.position.x, item.position.y],  # Vector2i 需要转换为数组
# 			"level": item.level
# 		}
# 		json_array.append(item_dict)

# 	# 序列化为 JSON 字符串
# 	var json_string = JSON.stringify(json_array)

# 	# 写入文件
# 	var file = FileAccess.open("res://level1.json", FileAccess.WRITE)
# 	if file:
# 		file.store_string(json_string)
# 		file.close()
# 		print("Data saved to JSON successfully!")
# 	else:
# 		print("Failed to open file for writing.")
