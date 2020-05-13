class_name ComplexBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		VisiblePrecondition.new(owner, "beacon", 
			Sequence.new([
				AnimateAction.new(owner, "alerted"),
				Selector.new([
					GetVarAction.new(owner, "attacking", true),
					Sequence.new([
						SetVarAction.new(owner, "last_patrolled", "door"),
						SetVarAction.new(owner, "attacking", true),
					]),
				]),
				RepeatFilter.new(2,
					PatrolBehaviourTree.new(owner)
				),
				Parallel.new([
					AnimateAction.new(owner, "alerted"),
					CombatBehaviourTree.new(owner),
				]),
				SetVarAction.new(owner, "attacking", false),
			])
		),
		PatrolBehaviourTree.new(owner),
	])
