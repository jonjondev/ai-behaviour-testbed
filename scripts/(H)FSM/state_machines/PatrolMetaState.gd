class_name PatrolMetaState
extends StateMachine

func _init(o).(o):
	current_state = PatrolDoorState
	transition_state_map = {
		PatrolDoorState: [
			[NavigatedToDoorTransition, PatrolSafeState],
		],
		PatrolSafeState: [
			[NavigatedToSafeTransition, PatrolDoorState],
		],
	}
	.setup()
