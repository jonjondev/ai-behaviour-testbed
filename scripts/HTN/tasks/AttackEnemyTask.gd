class_name AttackEnemyTask
extends CompoundTask

func _init():
	method_tasks = [
		[DoGunAttackTask.new()],
		[NavigateToEnemyTask.new(), DoSwordAttackTask.new()],
	]

func find_satisfied_method(working_worldstate: Array, cached_method: int) -> int:
	if (cached_method != 0 and cached_method != 1) and working_worldstate[HTNSensor.WorldStateProperties.GUN_ACQUIRED] == true:
		return 0
	elif (cached_method != 1) and working_worldstate[HTNSensor.WorldStateProperties.SWORD_ACQUIRED] == true:
		return 1
	else:
		return -1
