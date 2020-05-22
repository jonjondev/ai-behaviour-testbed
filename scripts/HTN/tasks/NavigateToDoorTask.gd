class_name NavigateToDoorTask
extends PrimitiveTask

func _init():
	operator = NavigateToOperator.new()
	effects = {}

func precondition_valid(working_worldstate: Array) -> bool:
	return true

func operate(owner) -> bool:
	return operator.operate(owner, owner.get_tree().get_nodes_in_group("door")[0])
