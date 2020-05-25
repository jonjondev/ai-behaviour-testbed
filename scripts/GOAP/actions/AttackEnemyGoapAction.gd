class_name AttackEnemyGoapAction
extends GoapAction

func _init(o).(o):
	preconditions = {
		GoapPlanner.StateConditions.ENEMY_ALIVE: true,
		GoapPlanner.StateConditions.SWORD_ACQUIRED: true,
	}
	effects = {
		GoapPlanner.StateConditions.ENEMY_ALIVE: false,
		GoapPlanner.StateConditions.SWORD_ACQUIRED: false,
	}
	target = owner.get_tree().get_nodes_in_group("enemy")[0]

func perform():
	if owner.is_near(target):
		target.attack()
		owner.blackboard.sword = false
		owner.animation.start_anim("unarmed")
		return true
	return false
