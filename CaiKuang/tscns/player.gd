extends Node2D

class_name  Player

var data:PlayerData


# 拖拽相关变量
var is_dragging = false
var drag_offset = Vector2.ZERO
var tile_map_layer: TileMapLayer

# 用于记录当前是否正在与矿石交互
var current_ore = null # 记录当前靠近的矿石节点



func _ready():
	# 获取兄弟节点 TileMapLayer 的引用
	# 假设 Player 和 TileMapLayer 是同一个父节点的子节点
	tile_map_layer = get_parent().get_parent().get_node("TileMapLayer")
	
	
	
	
func _input(event):
	
	# 1. 处理鼠标按下：开始拖拽
	if event is InputEventMouseButton \
		and event.pressed \
		and event.button_index == MOUSE_BUTTON_LEFT:
		
		# 简单的碰撞检测或距离检测，确保点到了 Player
		# 这里使用简单的矩形检测，或者你可以用 Raycast
		var rect = Rect2(global_position - Vector2(16, 16), Vector2(32, 32)) # 假设大小为 32x32
		if rect.has_point(get_global_mouse_position()):
			is_dragging = true
			current_ore = null
			
			# 记录偏移量，让物体跟随鼠标更自然
			drag_offset = global_position - get_global_mouse_position()
			z_index = 10 # 拖起时置顶


	# 2. 处理鼠标抬起：结束拖拽
	elif event is InputEventMouseButton and not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if is_dragging:
			is_dragging = false
			z_index = 0 # 放下时恢复层级
			
			snap_to_grid()
			print("dragging end")
			
			check_and_start()

	# 3. 处理鼠标移动：更新矿工位置
	elif event is InputEventMouseMotion and is_dragging:
		global_position = get_global_mouse_position() + drag_offset
		# 可以在这里加入边界限制，防止拖出地图

# 5. 吸附到格子的核心函数
func snap_to_grid():
	if not tile_map_layer: return

	# 步骤 A: 获取 Player 当前在 TileMapLayer 局部坐标系中的位置
	var local_pos = tile_map_layer.to_local(global_position)

	# 步骤 B: 将局部坐标转换为瓦片地图坐标 (Vector2i)
	# local_to_map 会自动处理取整，找到对应的格子
	var tile_coord = tile_map_layer.local_to_map(local_pos)
	# 判断是否超出范围
	tile_coord = get_safe_tile_size(tile_coord)

	# 步骤 C: 将瓦片坐标转换回局部坐标 (即格子的中心点或原点)
	var snapped_local_pos = tile_map_layer.map_to_local(tile_coord)

	# 步骤 D: 更新 Player 的最终位置
	# 如果需要转换回全局坐标（因为 Player 是兄弟节点，不在 TileMapLayer 内部）
	global_position = tile_map_layer.to_global(snapped_local_pos)
	data.position = tile_coord

	print("吸附到格子坐标: ", tile_coord)
	

func check_and_start():
	var tmp_ore :Ore = null
	
	var p = get_parent()
	for node in p.get_children():
		if node is Ore:
			if node.data.position == Vector2i(data.position.x, data.position.y-1) \
				or node.data.position == Vector2i(data.position.x, data.position.y+1) \
				or node.data.position == Vector2i(data.position.x-1, data.position.y) \
				or node.data.position == Vector2i(data.position.x+1, data.position.y):
				
				if tmp_ore == null:
					tmp_ore = node;
				elif node.data.level < tmp_ore.data.level:
					tmp_ore = node;
				
	current_ore = tmp_ore 


func get_safe_tile_size(size: Vector2i) -> Vector2i:
	var used_rect = tile_map_layer.get_used_rect()
	size.x = max(0, size.x)
	size.x = min(size.x, used_rect.size.x-1)
	size.y = max(0, size.y)
	size.y = min(size.y, used_rect.size.y-1)
	return size
