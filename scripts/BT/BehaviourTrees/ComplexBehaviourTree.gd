class_name ComplexBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		BeaconVisiblePrecondition.new(owner, 
			Sequence.new([
				ShowAlertedAction.new(owner),
				RepeatFilter.new(2,
					Sequence.new([
						NavigateAction.new(owner, "safe"),
						NavigateAction.new(owner, "door"),
					])
				),
				Parallel.new([
					ShowAlertedAction.new(owner),
					Selector.new([
						Sequence.new([
							NearBeaconCondition.new(owner),
							AttackBeaconAction.new(owner),
						]),
						NavigateToBeaconAction.new(owner),
					])
				]),
			])
		),
		Sequence.new([
			NavigateAction.new(owner, "safe"),
			NavigateAction.new(owner, "door"),
		]),
	])
