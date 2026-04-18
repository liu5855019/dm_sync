extends CharacterBody2D


@export var max_health := 100
@export var is_have_box := false

var move_speed := 50.0
var path_follow : PathFollow2D


func _ready() -> void:

	path_follow = $Path2D/PathFollow2D
	
	# 如果没有手动添加Path2D，则报错
	if not $Path2D.curve:
		push_error("Enemy has no movement path! Add a Path2D with curve.")

	refresh_health();

	
	
	
func _physics_process(delta: float) -> void:
	if Sys.isPase:
		return;



	if $Path2D.curve:  # 如果有路径
		path_follow.progress += move_speed * delta
		position = path_follow.position

		# 面向移动方向（可选）
		if path_follow.progress_ratio > 0.01:
			self.rotation = path_follow.rotation
			
func take_damage(damage:int) :
	max_health -= damage;

	refresh_health();
	
	if max_health <= 0:
		if is_have_box :
			if get_parent().get_parent().has_method("spawn_card") :
				get_parent().get_parent().spawn_card();
		queue_free()

func refresh_health():
	if is_have_box:
		$Label.text = str(max_health) + " 📦";
	else:
		$Label.text = str(max_health);
