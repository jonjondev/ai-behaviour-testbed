class_name PickupGunTask
extends PrimitiveTask

func _init():
	operator = UseObjectOperator.new()
	effects = {
		HTNSensor.WorldStateProperties.GUN_AVAILABLE: false,
		HTNSensor.WorldStateProperties.GUN_ACQUIRED: true,
	}

func precondition_valid(working_worldstate: Array) -> bool:
	return working_worldstate[HTNSensor.WorldStateProperties.GUN_AVAILABLE] == true

func operate(owner) -> bool:
	owner.blackboard.gun = true
	owner.animation.start_anim("armed_gun")
	return operator.operate(owner, owner.get_tree().get_nodes_in_group("gun")[0], "pickup")
