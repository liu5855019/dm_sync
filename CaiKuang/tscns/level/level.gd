extends Node2D

class_name Level


var player_scene = load("res://tscns/player/player.tscn")
var ore_scene = load("res://tscns/ore/ore.tscn")
var level_btn_scene = load("res://tscns/LevelBtn/LevelBtn.tscn")

var score: int = 0
signal score_changed(old_value: int, new_value: int)
signal max_player_level_changed(new_level: int)

@onready var score_node = $Score

var max_plarer_level = 1


# 声明一个只能存储 OreData 对象的数组
# var player_data_list: Array[OreData] = []
var player_data_list: Array = []

func _ready() -> void:

	_add_level_btns()

	player_data_list = LevelData.get_data_by_level(1)

	reload_scene()


func _add_level_btns():
	var level_btn_container = $ScrollContainer/HBoxContainer
	for i in range(1, 11):
		var level_btn = level_btn_scene.instantiate()
		level_btn.level = i
		level_btn.generate_player.connect(on_add_player_btn_pressed)
		self.max_player_level_changed.connect(level_btn.on_max_player_level_changed)
		self.score_changed.connect(level_btn.on_score_changed)
		level_btn_container.add_child(level_btn)


func _physics_process(delta: float) -> void:
	pass

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
	player.signal_merged.connect(_on_player_merged)
		
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

func _on_player_merged(new_level: int):
	if new_level > max_plarer_level:
		max_plarer_level = new_level
		print("当前最高玩家等级: ", max_plarer_level)
		max_player_level_changed.emit(max_plarer_level)

func on_add_player_btn_pressed(level: int, price: int):

	score -= price
	score_changed.emit(score + price, score)

	print("请求生成玩家，等级: ", level)
	var data = PlayerData.new()
	data.level = level
	data.position = Vector2i(0, 12)
	data.position = $TileMapLayer.find_nearby_null_tile(data.position)
	add_player(data)



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
