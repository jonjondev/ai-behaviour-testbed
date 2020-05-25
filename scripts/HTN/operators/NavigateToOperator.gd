class_name NavigateToOperator
extends Operator

func operate(owner, target = null, _param = null) -> bool:
	if owner.is_near(target):
		owner.navigation.target = null
		return true
	owner.navigation.target = target
	return false
