class_name PickupWeaponGoapAction
extends GoapAction

func _init(o).(o):
	preconditions = {
		GoapPlanner.StateConditions.WEAPON_AVAILABLE: true,
	}
	effects = {
		GoapPlanner.StateConditions.WEAPON_ACQUIRED: true,
		GoapPlanner.StateConditions.WEAPON_AVAILABLE: false,
	}
	target = owner.get_tree().get_nodes_in_group("weapon")[0]

func perform() -> bool:
	if owner.is_near(target):
		owner.blackboard.weapon = true
		target.visible = false
		owner.animation.start_anim("armed")
		return true
	return false
