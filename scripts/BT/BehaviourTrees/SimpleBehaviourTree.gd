class_name SimpleBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		Sequence.new([
			BeaconVisibleCondition.new(owner),
			ShowAlertedAction.new(owner),
			Selector.new([
				Sequence.new([
					NearBeaconCondition.new(owner),
					AttackBeaconAction.new(owner),
				]),
				NavigateToBeaconAction.new(owner),
			])
		]),
		Sequence.new([
			NavigateAction.new(owner, "safe"),
			NavigateAction.new(owner, "door"),
		]),
	])
