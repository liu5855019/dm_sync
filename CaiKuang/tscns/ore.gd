extends Node2D

class_name Ore


var data: OreData


# 定义采矿信号，携带矿石价值数据
signal mined(value: int)



# 采矿方法（比如被工具点击或玩家碰撞时调用）
func mining(act: int):
	if data.current_resource <= act:
		var value = data.current_resource
		data.current_resource -= value
		
		mined.emit(value)
		
		# 采矿后矿石消失或播放动画等效果
		queue_free()  # 删除矿石节点
	else:
		data.current_resource -= act
		mined.emit(act)
	
	print(data.current_resource)
		
