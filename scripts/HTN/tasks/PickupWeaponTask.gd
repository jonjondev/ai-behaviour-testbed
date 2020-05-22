class_name PickupWeaponTask
extends PrimitiveTask

func _init():
	operator = UseObjectOperator.new()
	effects = {
		HTNSensor.WorldStateProperties.WEAPON_AVAILABLE: false,
		HTNSensor.WorldStateProperties.WEAPON_ACQUIRED: true,
	}

func precondition_valid(working_worldstate: Array) -> bool:
	return working_worldstate[HTNSensor.WorldStateProperties.WEAPON_AVAILABLE] == true

func operate(owner) -> bool:
	owner.blackboard.weapon = true
	owner.animation.start_anim("armed")
	return operator.operate(owner, owner.get_tree().get_nodes_in_group("weapon")[0], "pickup")
