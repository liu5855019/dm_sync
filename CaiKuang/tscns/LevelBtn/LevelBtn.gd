extends Button


var player_price: int = 100
var max_player_level: int = 1
var level_score: int = 0

var _level: int = 1
var level: int:
	set(value):
		_level = value
		player_price = get_price_by_level(value)
		update_text()
	get:
		return _level



signal generate_player(level: int, price: int)


@onready var btn = $Button





func _ready() -> void:
	self.pressed.connect(_on_button_pressed)


func get_price_by_level(lev: int) -> int:
	if lev == 1:
		return 100
	
	return get_price_by_level(lev - 1) * 2


func on_max_player_level_changed(new_level: int) -> void:
	if new_level > max_player_level:
		max_player_level = new_level
	
	update_text()


func _on_button_pressed() -> void:
	generate_player.emit(level, player_price)


func on_score_changed(old_value: int, new_value: int) -> void:
	level_score = new_value
	update_text()


func update_text():
	
	self.text = "Level " + str(level) + "\nPrice: " + str(player_price)
	
	self.disabled = max_player_level < level or level_score < player_price
