class_name BeaconDisappearedTransition
extends Transition

func _init():
	next_state = load("res://scripts/FSM/states/PatrolDoorState.gd").new()

func is_valid():
	return not agent_body.current_state.target.visible

func on_transition():
	pass
