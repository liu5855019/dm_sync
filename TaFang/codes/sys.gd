extends Node

var speed = 2

# 游戏是否暂停
var isPase = false


# zidan

var zidanBaseAct:int = 100;
var zidanCurrentAct:int = zidanBaseAct;

var zidanBaseActTimes:int = 1;
var zidanCurrentActTimes:int = zidanBaseActTimes;

var zidanFlySpeed = 260
## times/second 次/秒  1秒多少次
var zidanBaseActSpeedTimesSecond:float = 0.5
var zidanActSpeedTimesSecond:float = zidanBaseActSpeedTimesSecond
var zidanMaxActSpeedTimesSecond:float = 5.0
## 攻速
var zidanActSpeed:float = 1 / zidanActSpeedTimesSecond       

var zidanCount = 1;
var zidanMaxCount = 15;




enum zidan_card_type {
	add_30_act,
	add_50_act,
	add_100_act,
	add_30_act_speed,
	add_50_act_speed,
	add_100_act_speed,
	add_1_count,
	add_2_count,
	add_4_count,
	add_1_act_times,
	add_2_act_times,
	add_3_act_times
}
