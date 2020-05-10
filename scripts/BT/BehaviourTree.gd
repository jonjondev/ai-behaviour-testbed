class_name BehaviourTree

var owner
var root: Behaviour

func _init(o):
	owner = o
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
	root.on_initialise()

func tick() -> void:
	var _status = root.update()
