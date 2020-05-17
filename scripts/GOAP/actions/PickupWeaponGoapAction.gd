class_name PickupWeaponGoapAction
extends GoapAction

func _init(o).(o):
	preconditions = {
		GoapPlanner.StateConditions.WEAPON_AVAILABLE: true,
	}
	effects = {
		GoapPlanner.StateConditions.WEAPON_ACQUIRED: true,
	}
	target = owner.get_tree().get_nodes_in_group("weapon")[0]

func perform() -> bool:
	if owner.is_near(target):
		owner.blackboard.weapon = true
		return true
	return false
