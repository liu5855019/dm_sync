extends Button


var player_price: int = 100
var max_player_level: int = 1

var _level: int = 1
var level: int:
	set(value):
		_level = value
		player_price = get_price_by_level(value)
		update_text()
	get:
		return _level

@onready var btn = $Button



func _ready() -> void:
	pass

func get_price_by_level(lev: int) -> int:
	if lev == 1:
		return 100
	
	return get_price_by_level(lev - 1) * 2


func on_max_player_level_changed(new_level: int) -> void:
	if new_level > max_player_level:
		max_player_level = new_level

	btn.disabled = max_player_level < level
	
	print("当前玩家价格: ", player_price)


func _on_button_pressed() -> void:
	
	pass # Replace with function body.


func update_text():
	
	self.text = "Level " + str(level) + "\nPrice: " + str(player_price)
	
	self.disabled = max_player_level < level
