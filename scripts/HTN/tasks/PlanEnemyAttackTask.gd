class_name PlanEnemyAttackTask
extends CompoundTask

func _init():
	method_tasks = [
		[AttackEnemyTask.new()],
		[NavigateToGunTask.new(), PickupGunTask.new(), self],
		[NavigateToSwordTask.new(), PickupSwordTask.new(), self],
	]

func find_satisfied_method(working_worldstate: Array, cached_method: int) -> int:
	if (cached_method != 0 and cached_method != 1 and cached_method != 2) and (working_worldstate[HTNSensor.WorldStateProperties.SWORD_ACQUIRED] == true or working_worldstate[HTNSensor.WorldStateProperties.GUN_ACQUIRED] == true):
		return 0
	elif (cached_method != 1 and cached_method != 2):
		return 1
	elif (cached_method != 2):
		return 2
	else:
		return -1
