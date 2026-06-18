extends Resource
class_name StoneData

@export var position: Vector2i = Vector2i.ZERO
var type: String = SysConst.type_stone

func _init(pos: Vector2i = Vector2i.ZERO):
	position = pos
