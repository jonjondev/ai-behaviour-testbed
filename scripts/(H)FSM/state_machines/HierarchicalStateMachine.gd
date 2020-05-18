class_name HierarchicalStateMachine
extends StateMachine

func _init(o).(o):
	current_state = PatrolMetaState
	transition_state_map = {
		PatrolMetaState: [
			[EnemyAppearedTransition, AttackEnemyState],
		],
		AttackEnemyState: [
			[EnemyDisappearedTransition, PatrolMetaState],
		],
	}
	.setup()
