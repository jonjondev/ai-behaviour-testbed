class_name UseObjectOperator
extends Operator

func operate(owner, target = null, function = null) -> bool:
	target.call(function)
	return true
