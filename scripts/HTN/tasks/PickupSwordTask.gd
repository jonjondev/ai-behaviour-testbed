class_name PickupSwordTask
extends PrimitiveTask

func _init():
	operator = UseObjectOperator.new()
	effects = {
		HTNSensor.WorldStateProperties.SWORD_AVAILABLE: false,
		HTNSensor.WorldStateProperties.SWORD_ACQUIRED: true,
	}

func precondition_valid(working_worldstate: Array) -> bool:
	return working_worldstate[HTNSensor.WorldStateProperties.SWORD_AVAILABLE] == true

func operate(owner) -> bool:
	owner.blackboard.sword = true
	owner.animation.start_anim("armed_sword")
	return operator.operate(owner, owner.get_tree().get_nodes_in_group("sword")[0], "pickup")
