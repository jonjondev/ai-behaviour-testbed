class_name NavigateAction
extends Action

var target_id
var target

func _init(o, id).(o):
	target_id = id

func on_initialise() -> void:
	target = owner.get_tree().get_nodes_in_group(target_id)[0]
	.on_initialise()

func update() -> int:
	owner.move_towards(target, owner.get_delta())
	return Status.RUNNING
