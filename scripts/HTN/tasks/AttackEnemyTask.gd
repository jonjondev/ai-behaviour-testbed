class_name AttackEnemyTask
extends CompoundTask

func _init():
	method_tasks = [
		[NavigateToEnemyTask.new(), DoEnemyAttackTask.new()],
		[NavigateToWeaponTask.new(), PickupWeaponTask.new(), self],
	]

func find_satisfied_method(working_worldstate: Array, cached_method: int) -> int:
	if (cached_method != 0) and working_worldstate[HTNSensor.WorldStateProperties.WEAPON_ACQUIRED] == true:
		return 0
	elif (cached_method != 1):
		return 1
	else:
		return -1
