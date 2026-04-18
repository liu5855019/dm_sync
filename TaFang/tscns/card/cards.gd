extends Node2D

var card_type_level1 = [
	Sys.zidan_card_type.add_30_act,
	Sys.zidan_card_type.add_30_act_speed,
	Sys.zidan_card_type.add_1_count,
	Sys.zidan_card_type.add_1_act_times
]

var card_type_level2 = [
	Sys.zidan_card_type.add_50_act,
	Sys.zidan_card_type.add_50_act_speed,
	Sys.zidan_card_type.add_2_count,
	Sys.zidan_card_type.add_2_act_times
]

var card_type_level3 = [
	Sys.zidan_card_type.add_100_act,
	Sys.zidan_card_type.add_100_act_speed,
	Sys.zidan_card_type.add_4_count,
	Sys.zidan_card_type.add_3_act_times
]



func _ready():
	reset()


func reset() :
	$card1.setCardType(random_card());
	$card2.setCardType(random_card());
	$card3.setCardType(random_card());



## 根据几率随机生成卡牌
func random_card() -> Sys.zidan_card_type:

	var random = RandomNumberGenerator.new();
	random.randomize();

	var level = 1;
	var value = random.randi_range(1, 10000);
	if value <= 7000:
		level = 1;
	elif value <= 9500:
		level = 2;
	else:
		level = 3;

	var card_pool = get_cards(level);
	var rand_value = random.randi_range(1, card_pool.size());


	return card_pool[rand_value - 1];



func get_cards(card_level):
	if card_level == 1:
		return card_type_level1;
	elif card_level == 2:
		return card_type_level2;
	elif card_level == 3:
		return card_type_level3;
	else:
		push_error("未知卡牌等级");
		return card_type_level1;
