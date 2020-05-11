class_name AttackBeaconAction
extends Action

var beacon

func _init(o).(o):
	pass

func on_initialise() -> void:
	beacon = owner.get_tree().get_nodes_in_group("beacon")[0]

func update() -> int:
	owner.move_towards(beacon, owner.get_delta())
	if owner.is_near(beacon):
		beacon.attack()
		owner.blackboard["is_alert"] = false
		return Status.SUCCESS
	return Status.RUNNING

func on_terminate(status) -> void:
	pass
