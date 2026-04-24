# PlayerData.gd
extends Resource
class_name PlayerData # 注册类名，方便在其他地方引用

var type: String = SysConst.type_player


# 属性定义

var position: Vector2i = Vector2i.ZERO # 位置信息
var act: int = 10
var mining_speed: float = 2.0


# @export var level: int = 1                   # 关卡等级
var _level: int = 0
var level: int:
	set(value):
		_level = value
		act = get_act(_level) # 根据等级自动计算 act
		print("level: ", _level, ", act: ", act)
	get:
		return _level


func get_act(lev: int) -> int:
	if lev == 1:
		return 10
	
	return get_act(lev - 1) * 1.9


# 构造函数（可选）
func _init(lvl: int = 1, pos: Vector2i = Vector2i.ZERO):
	level = lvl
	position = pos
