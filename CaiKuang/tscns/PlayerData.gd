# PlayerData.gd
extends Resource
class_name PlayerData # 注册类名，方便在其他地方引用

var type: String = Sys.type_player


# 属性定义
@export var level: int = 1                   # 关卡等级
@export var position: Vector2i = Vector2i.ZERO # 位置信息
@export var act: int = 10
var mining_speed: float = 2.0

# 构造函数（可选）
func _init(lvl: int = 1, pos: Vector2i = Vector2i.ZERO):
	level = lvl
	position = pos
