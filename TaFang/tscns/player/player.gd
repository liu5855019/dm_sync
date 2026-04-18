extends Node2D



func  _ready() -> void:
	pass
	
	
func _physics_process(delta: float) -> void:
	pass
	



func _on_static_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(viewport)
	print(event)
	print(shape_idx)
