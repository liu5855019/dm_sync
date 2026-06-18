extends TileMapLayer



func get_node_in_tile(pos: Vector2i) -> Node:
	for node in self.get_parent().get_node("Resources").get_children():
		if node is Ore and node.data.position == pos:
			return node
		if node is Player and node.data.position == pos:
			return node
		if node is Stone and node.data.position == pos:
			return node
	return null




func find_nearby_null_tile(loc: Vector2i) -> Vector2i:

	var positions = []
	var used_rect = self.get_used_rect()
	for x in used_rect.size.x:
		for y in used_rect.size.y:
			positions.append(Vector2i(x, y))

	var null_posi = null
	var min_dis = 9999
	for posi in positions:
		if get_node_in_tile(posi) == null:
			var dis = posi.distance_to(loc)
			if dis < min_dis:
				min_dis = dis
				null_posi = posi
	return null_posi # 如果周围没有空格子，返回 null
