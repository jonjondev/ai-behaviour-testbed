class_name BeaconAppearedTransition
extends Transition

func _init():
	next_state = load("res://scripts/FSM/states/AttackBeaconState.gd").new()

func is_valid():
	return agent_body.get_tree().get_nodes_in_group("beacon")[0].visible

func on_transition():
	pass
