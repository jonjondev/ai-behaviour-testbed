class_name PrimitiveTask

var operator: Operator
var effects: Dictionary

func precondition_valid(_working_worldstate: Array) -> bool:
	return false

func operate(_owner) -> bool:
	return false
