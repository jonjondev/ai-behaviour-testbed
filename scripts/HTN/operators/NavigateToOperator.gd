class_name NavigateToOperator
extends Operator

func operate(owner, target) -> bool:
	if owner.is_near(target):
		return true
	owner.navigation.target = target
	return false
