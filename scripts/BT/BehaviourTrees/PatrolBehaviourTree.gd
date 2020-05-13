class_name PatrolBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Sequence.new([
		Selector.new([
			GetVarAction.new(owner, "last_patrolled", "safe"),
			Sequence.new([
				NearCondition.new(owner, "safe"),
				SetVarAction.new(owner, "last_patrolled", "safe"),
			]),
			NavigateAction.new(owner, "safe"),
		]),
		Selector.new([
			GetVarAction.new(owner, "last_patrolled", "door"),
			Sequence.new([
				NearCondition.new(owner, "door"),
				SetVarAction.new(owner, "last_patrolled", "door"),
			]),
			NavigateAction.new(owner, "door"),
		]),
	])
