class_name SimpleBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Selector.new([
		Sequence.new([
			BeaconVisibleCondition.new(owner),
			AttackBeaconAction.new(owner),
		]),
		Sequence.new([
			PatrolSafeAction.new(owner),
			PatrolDoorAction.new(owner),
		]),
	])
