class_name BeGuardTask
extends CompoundTask

# CompoundTask[BeGuardTask]
	# Method[ENEMY_ALIVE == true]
		# Subtasks[AttackEnemyTask()]
	# Method[true]
		# Subtasks[NavigateToDoorTask(), NavigateToSafeTask()]
# CompoundTask[AttackEnemyTask]
	# Method[WEAPON_ACQUIRED == true]
		# Subtasks[NavigateToEnemyTask(), DoEnemyAttackTask()]
	# Method[true]
		# Subtasks[NavigateToWeaponTask(), PickupWeaponTask(), AttackEnemyTask()]
# PrimitiveTask[PickupWeaponTask] (weapon available)
	# UseObjectOperator
	# AnimateOperator
		# Effects[WEAPON_AVAILABLE = false, WEAPON_ACQUIRED = true]
# PrimitiveTask[DoEnemyAttackTask]
	# UseObjectOperator
	# AnimateOperator
		# Effects[WEAPON_ACQUIRED = false, ENEMY_ALIVE = false]
# PrimitiveTask[NavigateToEnemyTask]
	# NavigateOperator
# PrimitiveTask[NavigateToWeaponTask]
	# NavigateOperator
# PrimitiveTask[NavigateToDoorTask]
	# NavigateOperator
# PrimitiveTask[NavigateToSafeTask]
	# NavigateOperator
