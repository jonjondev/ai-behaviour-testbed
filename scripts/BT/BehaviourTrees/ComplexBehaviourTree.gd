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
						PatrolSafeAction.new(owner),
						PatrolDoorAction.new(owner),
					])
				),
				Parallel.new([
					ShowAlertedAction.new(owner),
					AttackBeaconAction.new(owner),
				]),
			])
		),
		Sequence.new([
			PatrolSafeAction.new(owner),
			PatrolDoorAction.new(owner),
		]),
	])
