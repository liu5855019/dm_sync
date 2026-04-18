extends Area2D

## 宽度
var width = 8;


## 攻击力
var act = 0;
var maxActTimes = 0;
var currentActTimes = 0;

func _ready() -> void:
	$Polygon2D.polygon = $CollisionPolygon2D.polygon

	act = Sys.zidanCurrentAct;
	maxActTimes = Sys.zidanCurrentActTimes;
	
	
	
	
	
func _physics_process(delta: float) -> void:
	if Sys.isPase:
		return;

	position.y -= delta * Sys.zidanFlySpeed
	
	if 	position.y < -50:
		queue_free()
	


# 当子弹与其他物体发生碰撞时
func _on_body_entered(body: Node2D) -> void:
	if currentActTimes >= maxActTimes:
		print("may be 多计算攻击次数")
		queue_free()
		return;

	if body.has_method("take_damage"):
		body.take_damage(act)
		currentActTimes += 1;
		if currentActTimes >= maxActTimes:
			queue_free()


#func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#print("shape")


func getPositionX(maxCount, courrentIndex, basePositionX) -> int:
	return (basePositionX - (maxCount - 1) * width ) + courrentIndex * width * 2;
