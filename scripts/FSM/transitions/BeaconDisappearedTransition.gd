class_name BeaconDisappearedTransition
extends Transition

func _init(owner).(owner):
	pass

func is_valid():
	return not owner.get_tree().get_nodes_in_group("beacon")[0].visible

func on_transition():
	pass
