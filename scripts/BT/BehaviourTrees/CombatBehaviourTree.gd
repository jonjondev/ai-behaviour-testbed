class_name CombatBehaviourTree
extends BehaviourTree

func _init(o).(o):
	root = \
	Sequence.new([
		NavigateToBehaviourTree.new(owner, "beacon"),
		AttackAction.new(owner, "beacon"),
	])
