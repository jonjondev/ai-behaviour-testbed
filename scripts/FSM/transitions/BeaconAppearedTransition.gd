class_name BeaconAppearedTransition
extends Transition

func _init(owner).(owner):
	pass

func is_valid():
	return agent_body.get_tree().get_nodes_in_group("beacon")[0].visible

func on_transition():
	pass
