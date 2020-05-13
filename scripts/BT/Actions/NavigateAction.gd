class_name NavigateAction
extends Action

var target_id
var target

func _init(o, target).(o):
	target_id = target

func on_initialise() -> void:
	target = owner.get_tree().get_nodes_in_group(target_id)[0]
	.on_initialise()

func update() -> int:
	if current_status == Status.SUCCESS:
		return Status.SUCCESS
	owner.move_towards(target, owner.get_delta())
	if owner.is_near(target):
		return Status.SUCCESS
	else:
		return Status.RUNNING
