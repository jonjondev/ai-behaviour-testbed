class_name FullStateMachine
extends StateMachine

func _init(o).(o):
	current_state = PatrolDoorState
	transition_state_map = {
		PatrolDoorState: [
			[NavigatedToDoorTransition, PatrolSafeState],
			[EnemyAppearedTransition, AttackEnemyState],
		],
		PatrolSafeState: [
			[NavigatedToSafeTransition, PatrolDoorState],
			[EnemyAppearedTransition, AttackEnemyState],
		],
		AttackEnemyState: [
			[EnemyDisappearedTransition, PatrolDoorState],
		],
	}
	.setup()
