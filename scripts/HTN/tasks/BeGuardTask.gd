class_name BeGuardTask
extends CompoundTask

func _init():
	method_tasks = [
		[PlanEnemyAttackTask.new()],
		[NavigateToDoorTask.new(), NavigateToSafeTask.new()],
	]

func find_satisfied_method(working_worldstate: Array, cached_method: int) -> int:
	if (cached_method != 0) and working_worldstate[HTNSensor.WorldStateProperties.ENEMY_ALIVE] == true:
		return 0
	elif (cached_method != 1):
		return 1
	else:
		return -1
