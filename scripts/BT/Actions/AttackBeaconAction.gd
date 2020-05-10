class_name AttackBeaconAction
extends Action

var beacon

func _init(o).(o):
	pass

func on_initialise() -> void:
	beacon = owner.get_tree().get_nodes_in_group("beacon")[0]

func update() -> int:
	owner.move_towards(beacon, owner.get_delta())
	return Status.SUCCESS if owner.is_near(beacon) else Status.RUNNING

func on_terminate(status) -> void:
	pass
