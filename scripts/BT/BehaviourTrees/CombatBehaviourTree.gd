class_name CombatBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		Sequence.new([
			NearCondition.new(owner, "beacon"),
			AttackAction.new(owner, "beacon"),
		]),
		NavigateAction.new(owner, "beacon"),
	])