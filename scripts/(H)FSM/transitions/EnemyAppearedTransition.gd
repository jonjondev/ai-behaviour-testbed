class_name EnemyAppearedTransition
extends Transition

func _init(owner).(owner):
	pass

func is_valid():
	return owner.get_tree().get_nodes_in_group("enemy")[0].visible

func on_transition():
	pass
