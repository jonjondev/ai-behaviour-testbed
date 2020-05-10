class_name BeaconVisibleCondition
extends Condition

var beacon

func _init(o).(o):
	pass

func on_initialise() -> void:
	beacon = owner.get_tree().get_nodes_in_group("beacon")[0]
	.on_initialise()

func update() -> int:
	if beacon and beacon.visible:
		return Status.SUCCESS
	return Status.FAILURE

func on_terminate(status) -> void:
	pass
