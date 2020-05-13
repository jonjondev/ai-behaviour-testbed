class_name SimpleBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		Sequence.new([
			VisibleCondition.new(owner, "beacon"),
			Selector.new([
				GetVarAction.new(owner, "alerted", true),
				Sequence.new([
					AnimateAction.new(owner, "alerted"),
					SetVarAction.new(owner, "alerted", true),
				]),
			]),
			CombatBehaviourTree.new(owner),
			SetVarAction.new(owner, "alerted", false),
		]),
		PatrolBehaviourTree.new(owner),
	])
