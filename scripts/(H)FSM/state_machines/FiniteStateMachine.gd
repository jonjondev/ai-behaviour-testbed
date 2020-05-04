class_name FullStateMachine
extends StateMachine

func _init(o).(o):
	current_state = PatrolDoorState
	transition_state_map = {
		PatrolDoorState: [
			[NavigatedToDoorTransition, PatrolSafeState],
			[BeaconAppearedTransition, AttackBeaconState],
		],
		PatrolSafeState: [
			[NavigatedToSafeTransition, PatrolDoorState],
			[BeaconAppearedTransition, AttackBeaconState],
		],
		AttackBeaconState: [
			[BeaconDisappearedTransition, PatrolDoorState],
		],
	}
	.setup()
