class_name PickupSwordGoapAction
extends GoapAction

func _init(o).(o):
	preconditions = {
		GoapPlanner.StateConditions.SWORD_AVAILABLE: true,
	}
	effects = {
		GoapPlanner.StateConditions.SWORD_ACQUIRED: true,
		GoapPlanner.StateConditions.SWORD_AVAILABLE: false,
	}
	target = owner.get_tree().get_nodes_in_group("sword")[0]

func perform() -> bool:
	if owner.is_near(target):
		owner.blackboard.sword = true
		target.visible = false
		owner.animation.start_anim("armed_sword")
		return true
	return false
