# PlayerData.gd
extends Resource
class_name PlayerData # 注册类名，方便在其他地方引用

# 属性定义
@export var level: int = 1                   # 关卡等级
@export var position: Vector2 = Vector2.ZERO # 位置信息
@export var act: int = 100


# 构造函数（可选）
func _init(lvl: int = 1, pos: Vector2 = Vector2.ZERO):
	level = lvl
	position = pos
