extends Node2D

class_name Ore


var data: OreData

func cai_kuang(act: int):
	if data.current_resource < act:
		data.current_resource -= data.current_resource
	else:
		data.current_resource -= act
	
	print(data.current_resource)
		
