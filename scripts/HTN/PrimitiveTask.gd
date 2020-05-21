class_name PrimitiveTask

var operator: Operator
var effects: Dictionary

func precondition_valid(working_worldstate: Array) -> bool:
	return false

func operate(owner) -> bool:
	return false
