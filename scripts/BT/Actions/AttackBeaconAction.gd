class_name AttackBeaconAction
extends Action

var beacon

func _init(o).(o):
	pass

func on_initialise() -> void:
	beacon = owner.get_tree().get_nodes_in_group("beacon")[0]
	.on_initialise()

func update() -> int:
	beacon.attack()
	return Status.SUCCESS
