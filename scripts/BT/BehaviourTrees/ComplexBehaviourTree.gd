class_name ComplexBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		VisiblePrecondition.new(owner, "beacon", 
			Sequence.new([
				Selector.new([
					GetVarAction.new(owner, "alerted1", true),
					Sequence.new([
						AnimateAction.new(owner, "alerted"),
						SetVarAction.new(owner, "alerted1", true),
					]),
				]),
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
					Selector.new([
						GetVarAction.new(owner, "alerted2", true),
						Sequence.new([
							AnimateAction.new(owner, "alerted"),
							SetVarAction.new(owner, "alerted2", true),
						]),
					]),
					CombatBehaviourTree.new(owner),
				]),
				SetVarAction.new(owner, "attacking", false),
				SetVarAction.new(owner, "alerted1", false),
				SetVarAction.new(owner, "alerted2", false),
			])
		),
		PatrolBehaviourTree.new(owner),
	])
