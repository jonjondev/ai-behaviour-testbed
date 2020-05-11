class_name PatrolSafeAction
extends Action

var safe

func _init(o).(o):
	pass

func on_initialise() -> void:
	safe = owner.get_tree().get_nodes_in_group("safe")[0]

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	owner.move_towards(safe, owner.get_delta())
	if owner.is_near(safe):
		current_status = Status.SUCCESS
		return Status.SUCCESS
	else:
		return Status.RUNNING
