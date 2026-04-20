# OreData.gd
extends Resource
class_name OreData # 注册类名，方便在其他地方引用

# 属性定义
@export var level: int = 1                # 关卡等级
@export var position: Vector2i = Vector2i.ZERO # 位置信息
@export var resource: int = 100
@export var current_resource: int = 100
var type: String = Sys.type_ore

# 构造函数（可选）
func _init(lvl: int = 1, pos: Vector2i = Vector2i.ZERO):
	level = lvl
	position = pos
