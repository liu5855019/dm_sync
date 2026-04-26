extends Node2D

class_name  Player

var data:PlayerData


@onready var level_label = $Label

# 拖拽相关变量
var is_dragging = false
var drag_offset = Vector2.ZERO
var tile_map_layer: TileMapLayer

# 用于记录当前是否正在与矿石交互
var current_ore = null # 记录当前靠近的矿石节点
var mining_interval = 0


signal signal_merged(new_level: int)


func _ready():
	# 获取 TileMapLayer 的引用
	tile_map_layer = get_parent().get_parent().get_node("TileMapLayer")

	level_label.text = str(data.level)
	
	
	
func _physics_process(delta: float) -> void:
	if Sys.is_pase:
		return;

	if is_dragging:
		# 拖动时不进行其他逻辑处理
		mining_interval = 0
		return

	# 如果当前没有正在交互的矿石，检查周围是否有矿石可以交互    
	mining_interval += delta
	if mining_interval >= data.mining_speed:
		mining_interval = 0
		if current_ore == null:
			check_and_start()
			
		if current_ore != null:
			current_ore.mining(data.act)

	
	
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
	# 确保 tile_coord 在地图范围内，避免越界
	tile_coord = get_safe_tile_size(tile_coord)
	var node = get_node_in_tile(tile_coord)
	if node != null and node is Player and node != self:
		if node.data.level == data.level:
			merge(node)
		else: # 调换位置
			var temp_pos = node.data.position
			node.data.position = data.position
			data.position = temp_pos
			
			# 更新两个玩家的位置
			node.global_position = tile_map_layer.to_global(tile_map_layer.map_to_local(node.data.position))
			global_position = tile_map_layer.to_global(tile_map_layer.map_to_local(data.position))
			return

	if node != null and node is Ore:
		# 如果格子上有矿石，找到附近的空格子
		var nearby_null_tile = find_nearby_null_tile(tile_coord)
		if nearby_null_tile != null:
			tile_coord = nearby_null_tile
		else:
			print("没有找到附近的空格子，无法移动")
			queue_free() # 删除玩家节点
			return
		

	# 步骤 C: 将瓦片坐标转换回局部坐标 (即格子的中心点或原点)
	var snapped_local_pos = tile_map_layer.map_to_local(tile_coord)

	# 步骤 D: 更新 Player 的最终位置
	# 如果需要转换回全局坐标（因为 Player 是兄弟节点，不在 TileMapLayer 内部）
	global_position = tile_map_layer.to_global(snapped_local_pos)
	data.position = tile_coord

	print("吸附到格子坐标: ", tile_coord)
	
func merge(player: Player):
	if player.data.level == data.level:
		data.level += 1
		player.queue_free() # 删除被合并的玩家节点
		level_label.text = str(data.level)
		print("合并成功，当前等级: ", data.level)
		signal_merged.emit(data.level)
	else:
		print("无法合并，等级不匹配")

func find_nearby_null_tile(loc: Vector2i) -> Vector2i:

	var positions = []
	var used_rect = tile_map_layer.get_used_rect()
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


func get_node_in_tile(pos: Vector2i) -> Node:
	var p = get_parent()
	for node in p.get_children():
		if node is Ore and node.data.position == pos:
			return node
		if node is Player and node.data.position == pos:
			return node
	return null



func get_safe_tile_size(size: Vector2i) -> Vector2i:
	var used_rect = tile_map_layer.get_used_rect()
	size.x = max(0, size.x)
	size.x = min(size.x, used_rect.size.x-1)
	size.y = max(0, size.y)
	size.y = min(size.y, used_rect.size.y-1)
	return size
