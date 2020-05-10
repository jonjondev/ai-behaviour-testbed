class_name PatrolSafeAction
extends Action

var safe

func _init(o).(o):
	pass

func on_initialise() -> void:
	safe = owner.get_tree().get_nodes_in_group("safe")[0]

func update() -> int:
	if owner.blackboard.get("last_patrolled") == "safe":
		return Status.SUCCESS
	owner.move_towards(safe, owner.get_delta())
	if owner.is_near(safe):
		owner.blackboard["last_patrolled"] = "safe"
		return Status.SUCCESS
	else:
		return Status.RUNNING

func on_terminate(status) -> void:
	pass
