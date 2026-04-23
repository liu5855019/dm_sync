extends Node2D

class_name Level


var player_scene = load("res://tscns/player/player.tscn")
var ore_scene = load("res://tscns/ore/ore.tscn")

var score = 0.0
signal score_changed(old_value: int, new_value: int)

@onready var score_node = $Score

# 声明一个只能存储 OreData 对象的数组
# var player_data_list: Array[OreData] = []
var player_data_list: Array = []

func _ready() -> void:
	player_data_list.append(OreData.new(1,Vector2(0, 0)))
	player_data_list.append(OreData.new(1,Vector2(1, 0)))
	player_data_list.append(OreData.new(2, Vector2(1, 1)))
	player_data_list.append(OreData.new(2, Vector2(1, 2)))
	player_data_list.append(OreData.new(3, Vector2(1, 3)))
	
	player_data_list.append(OreData.new(4, Vector2(1, 4)))
	player_data_list.append(OreData.new(5, Vector2(1, 5)))
	player_data_list.append(OreData.new(6, Vector2(1, 6)))

	player_data_list.append(PlayerData.new(1, Vector2(0, 10)))
	
	reload_scene()


	
	
	
func _physics_process(delta: float) -> void:
	return

func reload_scene() -> void:
	for data in player_data_list:
		if data is PlayerData:
			add_player(data)
		if data is OreData:
			add_ore(data)


func add_ore(data:OreData):
	var ore = ore_scene.instantiate()
	ore.data = data
	ore.mined.connect(_on_ore_mined)
		
	# 步骤 C: 将瓦片坐标转换回局部坐标 (即格子的中心点或原点)
	var snapped_local_pos = $TileMapLayer.map_to_local(data.position)

	#如果需要转换回全局坐标（因为 Player 是兄弟节点，不在 TileMapLayer 内部）
	var p = $TileMapLayer.to_global(snapped_local_pos)
	ore.position = p
	
	$Resources.add_child(ore)

func add_player(data: PlayerData):
	var player = player_scene.instantiate()
	player.data = data
		
	# 步骤 C: 将瓦片坐标转换回局部坐标 (即格子的中心点或原点)
	var snapped_local_pos = $TileMapLayer.map_to_local(data.position)

	#如果需要转换回全局坐标（因为 Player 是兄弟节点，不在 TileMapLayer 内部）
	var p = $TileMapLayer.to_global(snapped_local_pos)
	player.position = p
	
	$Resources.add_child(player)


func _on_ore_mined(value: int):
	score += value
	score_changed.emit(score - value, score)

	score_node.on_score_changed(score-value, score)


#
#func spawn_enemy(is_have_box: bool):
	#var enemy = enemy_scene.instantiate()
	#enemy.position = Vector2(-100,-100)
	#
	#enemy.max_health = enemy_health
	#enemy_health *= enemy_health_b
#
	#enemy.is_have_box = is_have_box
	#
	#$enemys.add_child(enemy)
	#
#
### 生成子弹
#func take_bullte(delta):
	#zidanCurrentInterval += delta;
	#
	#if zidanCurrentInterval > Sys.zidanActSpeed :
		#for i in Sys.zidanCount :
			#var zidan = zidanScene.instantiate()
			#zidan.position = $player.position;
			#zidan.position.x = zidan.getPositionX(Sys.zidanCount, i, $player.position.x);
#
			#$bulltes.add_child(zidan);
			#zidanCurrentInterval = 0;
#
#
### 生成卡牌
#func spawn_card() -> void:
	#Sys.isPase = true;
	#$cards.reset();
	#$cards.visible = true;
	#
