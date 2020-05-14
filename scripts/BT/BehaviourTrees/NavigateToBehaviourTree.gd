class_name NavigateToBehaviourTree
extends BehaviourTree

func _init(o, target_id).(o):
	root = \
	Parallel.new(Parallel.Policy.REQ_ONE, Parallel.Policy.REQ_ALL, [
		NearCondition.new(owner, target_id),
		NavigateAction.new(owner, target_id),
	])
