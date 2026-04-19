# OreData.gd
extends Resource
class_name OreData # 注册类名，方便在其他地方引用

# 属性定义
@export var level: int = 1                # 关卡等级
@export var position: Vector2 = Vector2.ZERO # 位置信息
@export var resource: int = 100
@export var current_resource: int = 100

# 构造函数（可选）
func _init(lvl: int = 1, pos: Vector2 = Vector2.ZERO):
	level = lvl
	position = pos

# 辅助方法：更新数据
func update_data(new_level: int, new_pos: Vector2):
	level = new_level
	position = new_pos
	print("数据已更新: 关卡 ", level, ", 位置 ", position)
