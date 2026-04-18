extends Button

#GradientTexture2D


var current_card_type :Sys.zidan_card_type = Sys.zidan_card_type.add_30_act;



func _ready() -> void:
	var a:GradientTexture2D = self.icon;
	
	var gradient = Gradient.new()
	gradient.set_color(0, Color.RED)
	gradient.set_color(1, Color.BLUE)

	a.gradient = gradient;

	
func _on_pressed() -> void:
	Sys.isPase = false;

	if current_card_type == null:
		return;

	if current_card_type == Sys.zidan_card_type.add_30_act:
		addAct(0.3);
	elif current_card_type == Sys.zidan_card_type.add_50_act:
		addAct(0.5);
	elif current_card_type == Sys.zidan_card_type.add_100_act:
		addAct(1.0);
	elif current_card_type == Sys.zidan_card_type.add_30_act_speed:
		addSpeed(0.3);
	elif current_card_type == Sys.zidan_card_type.add_50_act_speed:
		addSpeed(0.5);
	elif current_card_type == Sys.zidan_card_type.add_100_act_speed:
		addSpeed(1.0);
	elif current_card_type == Sys.zidan_card_type.add_1_count:
		addCount(1)
	elif current_card_type == Sys.zidan_card_type.add_2_count:
		addCount(2)
	elif current_card_type == Sys.zidan_card_type.add_4_count:
		addCount(4)
	elif current_card_type == Sys.zidan_card_type.add_1_act_times:
		addActTimes(1)
	elif current_card_type == Sys.zidan_card_type.add_2_act_times:
		addActTimes(2)
	elif current_card_type == Sys.zidan_card_type.add_3_act_times:
		addActTimes(3)
	else:
		push_error("未知卡牌类型");
	get_parent().visible = false;
	

func addAct(value:float) -> void:
	var b = float(Sys.zidanCurrentAct) / Sys.zidanBaseAct;

	Sys.zidanCurrentAct = round(Sys.zidanBaseAct * (b + value));



func addSpeed(value: float) -> void:
	var b = Sys.zidanActSpeedTimesSecond / Sys.zidanBaseActSpeedTimesSecond;
	print("b:", b);

	Sys.zidanActSpeedTimesSecond = Sys.zidanBaseActSpeedTimesSecond * (b + value);

	if Sys.zidanActSpeedTimesSecond > Sys.zidanMaxActSpeedTimesSecond:
		Sys.zidanActSpeedTimesSecond = Sys.zidanMaxActSpeedTimesSecond;

	Sys.zidanActSpeed = 1 / Sys.zidanActSpeedTimesSecond;

func addCount(value:int) -> void:
	Sys.zidanCount += value;
	if Sys.zidanCount > Sys.zidanMaxCount:
		Sys.zidanCount = Sys.zidanMaxCount;


func addActTimes(value:int) -> void:
	Sys.zidanCurrentActTimes += value;


func setCardType(card_type: Sys.zidan_card_type) -> void:
	current_card_type = card_type;
	self.text = get_card_description(card_type);





## 根据卡牌类型返回对应的描述
func get_card_description(card_type: Sys.zidan_card_type) -> String:
	match card_type:
		Sys.zidan_card_type.add_30_act:
			return "增加 30% 攻击力"
		Sys.zidan_card_type.add_50_act:
			return "增加 50% 攻击力"
		Sys.zidan_card_type.add_100_act:
			return "增加 100% 攻击力"
		Sys.zidan_card_type.add_30_act_speed:
			return "增加 30% 攻速"
		Sys.zidan_card_type.add_50_act_speed:
			return "增加 50% 攻速"
		Sys.zidan_card_type.add_100_act_speed:
			return "增加 100% 攻速"
		Sys.zidan_card_type.add_1_count:
			return "增加 1 发子弹"
		Sys.zidan_card_type.add_2_count:
			return "增加 2 发子弹"
		Sys.zidan_card_type.add_4_count:
			return "增加 4 发子弹"
		Sys.zidan_card_type.add_1_act_times:
			return "穿透 +1"
		Sys.zidan_card_type.add_2_act_times:
			return "穿透 +2"
		Sys.zidan_card_type.add_3_act_times:
			return "穿透 +3"	
		_:
			return "未知卡牌类型"
