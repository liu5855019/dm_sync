extends Node2D


@onready var label = $Label

func on_score_changed(old_value: int, new_value: int):
	label.text = "Score: " + str(new_value)
