class_name GoapAgent

var goal_state = {
	GoapPlanner.StateConditions.ENEMY_ALIVE: false,
}

var actions = [
	AttackEnemyGoapAction,
	PickupWeaponGoapAction,
]

func _init(owner):
	for i in range(actions.size()):
		actions[i] = actions[i].new(owner)
