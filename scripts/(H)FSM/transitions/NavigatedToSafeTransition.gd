class_name NavigatedToSafeTransition
extends Transition

func _init(owner).(owner):
	pass

func is_valid():
	return owner.is_near_target(owner.get_tree().get_nodes_in_group("safe")[0])

func on_transition():
	pass
