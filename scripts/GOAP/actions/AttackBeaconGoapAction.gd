class_name AttackBeaconGoapAction
extends GoapAction

func _init(o).(o):
	preconditions = {
		GoapPlanner.StateConditions.BEACON_ALIVE: true,
		GoapPlanner.StateConditions.WEAPON_ACQUIRED: true,
	}
	effects = {
		GoapPlanner.StateConditions.BEACON_ALIVE: false,
		GoapPlanner.StateConditions.WEAPON_ACQUIRED: false,
	}
	target = owner.get_tree().get_nodes_in_group("beacon")[0]

func perform():
	if owner.is_near(target):
		target.attack()
		owner.blackboard.weapon = false
		return true
	return false
