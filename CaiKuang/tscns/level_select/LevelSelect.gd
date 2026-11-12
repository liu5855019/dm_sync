extends Control

const difficulty_names = ["入门", "简单", "稍难", "挑战", "困难", "艰难", "险恶", "深渊", "地狱", "噩梦"]

func _ready() -> void:
	var bg = ColorRect.new()
	bg.color = Color(0.7, 0.85, 1.0)
	bg.size = Vector2(320, 640)
	bg.position = Vector2(0, 0)
	add_child(bg)

	var title = Label.new()
	title.text = "选 择 关 卡"
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	title.position = Vector2(0, 30)
	title.size = Vector2(320, 60)
	title.theme_override_font_sizes.font_size = 28
	add_child(title)

	var grid = GridContainer.new()
	grid.columns = 2
	grid.position = Vector2(30, 120)
	grid.size = Vector2(260, 460)
	grid.add_theme_constant_override("h_separation", 20)
	grid.add_theme_constant_override("v_separation", 20)
	add_child(grid)

	for i in range(10):
		var lvl = i + 1
		var btn = Button.new()
		btn.text = "第%d关\n%s" % [lvl, difficulty_names[i]]
		btn.size = Vector2(120, 80)
		btn.pressed.connect(_on_level_selected.bind(lvl))
		grid.add_child(btn)

func _on_level_selected(level: int) -> void:
	Sys.current_level = level
	get_tree().change_scene_to_file("res://tscns/level/level.tscn")
