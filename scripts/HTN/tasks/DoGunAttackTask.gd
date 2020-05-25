class_name DoGunAttackTask
extends PrimitiveTask

func _init():
	operator = UseObjectOperator.new()
	effects = {
		HTNSensor.WorldStateProperties.ENEMY_ALIVE: false,
		HTNSensor.WorldStateProperties.GUN_AVAILABLE: false,
	}

func precondition_valid(working_worldstate: Array) -> bool:
	return working_worldstate[HTNSensor.WorldStateProperties.ENEMY_ALIVE] == true and working_worldstate[HTNSensor.WorldStateProperties.GUN_ACQUIRED] == true

func operate(owner) -> bool:
	if not owner.animation.anim_running:
		owner.blackboard.gun = false
		return operator.operate(owner, owner.get_tree().get_nodes_in_group("enemy")[0], "attack")
	return false
