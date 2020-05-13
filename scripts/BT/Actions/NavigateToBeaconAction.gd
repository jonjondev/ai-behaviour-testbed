class_name NavigateToBeaconAction
extends Action

var beacon

func _init(o).(o):
	pass

func on_initialise() -> void:
	beacon = owner.get_tree().get_nodes_in_group("beacon")[0]
	.on_initialise()

func update() -> int:
	owner.move_towards(beacon, owner.get_delta())
	return Status.RUNNING
