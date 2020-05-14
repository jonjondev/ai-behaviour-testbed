class_name ComplexBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	ActiveSelector.new([
		VisiblePrecondition.new(owner, "beacon", 
			Sequence.new([
				Selector.new([
					GetVarAction.new(owner, "alerted1", true),
					Sequence.new([
						AnimateAction.new(owner, "alerted"),
						SetVarAction.new(owner, "alerted1", true),
						SetVarAction.new(owner, "last_patrolled", "door"),
					]),
				]),
				RepeatFilter.new(2,
					PatrolBehaviourTree.new(owner)
				),
				Parallel.new(Parallel.Policy.REQ_ALL, Parallel.Policy.REQ_ONE, [
					Selector.new([
						GetVarAction.new(owner, "alerted2", true),
						Sequence.new([
							AnimateAction.new(owner, "alerted"),
							SetVarAction.new(owner, "alerted2", true),
						]),
					]),
					CombatBehaviourTree.new(owner),
				]),
				SetVarAction.new(owner, "alerted1", false),
				SetVarAction.new(owner, "alerted2", false),
			])
		),
		PatrolBehaviourTree.new(owner),
	])
