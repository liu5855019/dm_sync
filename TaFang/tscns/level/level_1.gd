extends Node2D

var maxEnemies = 120
var enemyTime = 0.65
var currentEnemyCount = 1
var enemy_health = 100
var enemy_health_b = 1.05
var enemy_count_for_one_box = 4

var enemy_scene = load("res://tscns/enemy/enemy.tscn")



var zidanScene = load("res://tscns/wuqi/zidan.tscn")
var zidanCurrentInterval = 0



func _ready() -> void:
	$Timer.wait_time = enemyTime
	$Timer.start()

	$cards.visible = false
	
	
func _physics_process(delta: float) -> void:
	if Sys.isPase:
		return;
	take_bullte(delta)


func _on_timer_timeout() -> void:
	if Sys.isPase:
		return;
	if currentEnemyCount >= maxEnemies:
		$Timer.stop()
		print("敌人生成完毕！总计:", maxEnemies)
		return
	
	spawn_enemy(currentEnemyCount % enemy_count_for_one_box == 0)
	currentEnemyCount += 1
	
func spawn_enemy(is_have_box: bool):
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(-100,-100)
	
	enemy.max_health = enemy_health
	enemy_health *= enemy_health_b

	enemy.is_have_box = is_have_box
	
	$enemys.add_child(enemy)
	

## 生成子弹
func take_bullte(delta):
	zidanCurrentInterval += delta;
	
	if zidanCurrentInterval > Sys.zidanActSpeed :
		for i in Sys.zidanCount :
			var zidan = zidanScene.instantiate()
			zidan.position = $player.position;
			zidan.position.x = zidan.getPositionX(Sys.zidanCount, i, $player.position.x);

			$bulltes.add_child(zidan);
			zidanCurrentInterval = 0;


## 生成卡牌
func spawn_card() -> void:
	Sys.isPase = true;
	$cards.reset();
	$cards.visible = true;
	
