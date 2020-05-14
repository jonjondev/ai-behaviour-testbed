class_name NavigateAction
extends Action

var target_id
var target

func _init(o, id).(o):
	target_id = id

func on_initialise() -> void:
	target = owner.get_tree().get_nodes_in_group(target_id)[0]
	owner.navigation.set_target(self, target)
	.on_initialise()

func update() -> int:
	return Status.RUNNING

func on_terminate(status) -> void:
	owner.navigation.unset_target(self)
	.on_terminate(status)
