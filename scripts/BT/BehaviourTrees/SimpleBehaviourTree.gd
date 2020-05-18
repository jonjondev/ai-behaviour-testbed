class_name SimpleBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		Sequence.new([
			VisibleCondition.new(owner, "enemy"),
			AnimateAction.new(owner, "alerted"),
			CombatBehaviourTree.new(owner),
		]),
		PatrolBehaviourTree.new(owner),
	])
