class_name GoapAgent

var goal_state = {
	GoapPlanner.StateConditions.BEACON_ALIVE: false,
}

var actions = [
	AttackBeaconGoapAction,
	PickupWeaponGoapAction,
]

func _init(owner):
	for i in range(actions.size()):
		actions[i] = actions[i].new(owner)
