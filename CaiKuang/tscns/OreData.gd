# OreData.gd
extends Resource
class_name OreData # 注册类名，方便在其他地方引用

# 属性定义
@export var level: int = 1                # 关卡等级
@export var position: Vector2i = Vector2i.ZERO # 位置信息
@export var all_resource: int = 0
@export var current_resource: int = 0
var type: String = SysConst.type_ore

# 构造函数（可选）
func _init(lvl: int = 1, pos: Vector2i = Vector2i.ZERO, curr_res: int = 0):
	level = lvl
	position = pos
	all_resource = calculate_score_by_level(lvl)
	if curr_res > 0:
		current_resource = curr_res
	else:
		current_resource = all_resource

# 根据等级计算分数，每个等级分数是上一级的两倍
func calculate_score_by_level(level: int) -> int:
	if level <= 1:
		return 100  # 等级1基础分数
	else:
		# 递归计算：当前等级分数 = 上一等级分数 * 2
		return calculate_score_by_level(level - 1) * 2
